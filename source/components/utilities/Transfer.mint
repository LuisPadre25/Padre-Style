component Transfer {
  property data : Array(TransferItem) = []
  property height : Number = 280
  property showSearch : Bool = true
  property disabled : Bool = false
  property leftTitle : String = "Available"
  property rightTitle : String = "Selected"
  property checkAllText : String = "Select All"
  property transferAllText : String = "Transfer All"
  property searchPlaceholder : String = "Search items..."
  property isAsc : Bool = false
  property enableDoubleClick : Bool = true
  property onTransfer : Function(Array(TransferItem), Array(TransferItem), Promise(Void)) = (chosen : Array(TransferItem), unChosen : Array(TransferItem)) : Promise(Void) { next { } }

  state chosen : Array(TransferItem) = []
  state unChosen : Array(TransferItem) = []
  state leftSearchValue : String = ""
  state rightSearchValue : String = ""
  state lastData : Array(TransferItem) = []

  connect ThemeStore exposing { currentTheme }

  fun componentDidMount : Promise(Void) {
    initializeData()
  }

  fun componentDidUpdate : Promise(Void) {
    if !Array.isEmpty(data) && !arraysEqual(data, lastData) {
      initializeData()
    } else {
      next { }
    }
  }

  fun arraysEqual (arr1 : Array(TransferItem), arr2 : Array(TransferItem)) : Bool {
    if Array.size(arr1) != Array.size(arr2) {
      false
    } else {
      Array.all(
        Array.mapWithIndex(arr1, (item : TransferItem, index : Number) : Bool {
          case Array.at(arr2, index) {
            Maybe.Just(item2) => item.value == item2.value
            Maybe.Nothing => false
          }
        }),
        (result : Bool) : Bool { result }
      )
    }
  }

  fun initializeData : Promise(Void) {
    let chosenItems = Array.select(data, (item : TransferItem) : Bool { item.chosen })
    let unChosenItems = Array.select(data, (item : TransferItem) : Bool { !item.chosen })

    next {
      chosen: chosenItems,
      unChosen: unChosenItems,
      lastData: data,
      leftSearchValue: "",
      rightSearchValue: ""
    }
  }

  fun reset : Promise(Void) {
    let chosenItems = Array.select(data, (item : TransferItem) : Bool { item.chosen })
    let unChosenItems = Array.select(data, (item : TransferItem) : Bool { !item.chosen })

    next {
      chosen: chosenItems,
      unChosen: unChosenItems,
      leftSearchValue: "",
      rightSearchValue: ""
    }
  }

  fun selectItems (values : Array(String)) : Promise(Void) {
    let updatedChosen = Array.map(chosen, (item : TransferItem) : TransferItem {
      if Array.contains(item.value, values) {
        { item | selected: true }
      } else {
        item
      }
    })

    let updatedUnChosen = Array.map(unChosen, (item : TransferItem) : TransferItem {
      if Array.contains(item.value, values) {
        { item | selected: true }
      } else {
        item
      }
    })

    next {
      chosen: updatedChosen,
      unChosen: updatedUnChosen
    }
  }

  fun removeJustMoved : Promise(Void) {
    let updatedChosen = Array.map(chosen, (item : TransferItem) : TransferItem {
      { item | justMoved: false }
    })

    let updatedUnChosen = Array.map(unChosen, (item : TransferItem) : TransferItem {
      { item | justMoved: false }
    })

    next {
      chosen: updatedChosen,
      unChosen: updatedUnChosen
    }
  }

  fun handleItemClick (item : TransferItem, isChosen : Bool) : Promise(Void) {
    if disabled || item.disabled {
      next { }
    } else {
      if isChosen {
        let updatedChosen = Array.map(chosen, (currentItem : TransferItem) : TransferItem {
          if currentItem.value == item.value {
            { currentItem | selected: !currentItem.selected, justMoved: false }
          } else {
            { currentItem | justMoved: false }
          }
        })
        next { chosen: updatedChosen }
      } else {
        let updatedUnChosen = Array.map(unChosen, (currentItem : TransferItem) : TransferItem {
          if currentItem.value == item.value {
            { currentItem | selected: !currentItem.selected, justMoved: false }
          } else {
            { currentItem | justMoved: false }
          }
        })
        next { unChosen: updatedUnChosen }
      }
    }
  }

  fun handleTransferToRight : Promise(Void) {
    if disabled {
      next { }
    } else {
      let selectedItems = Array.select(unChosen, (item : TransferItem) : Bool { item.selected && !item.disabled })
      let remainingUnChosen = Array.select(unChosen, (item : TransferItem) : Bool { !item.selected || item.disabled })

      let newChosenItems = Array.map(selectedItems, (item : TransferItem) : TransferItem {
        { item | chosen: true, selected: false, justMoved: true }
      })

      let updatedChosen = if isAsc {
        Array.concat([newChosenItems, chosen])
      } else {
        Array.concat([chosen, newChosenItems])
      }

      next {
        chosen: updatedChosen,
        unChosen: remainingUnChosen
      }

      onTransfer(updatedChosen, remainingUnChosen)
    }
  }

  fun handleTransferAllToRight : Promise(Void) {
    if disabled {
      next { }
    } else {
      let availableItems = Array.select(unChosen, (item : TransferItem) : Bool { !item.disabled })
      let remainingUnChosen = Array.select(unChosen, (item : TransferItem) : Bool { item.disabled })

      let newChosenItems = Array.map(availableItems, (item : TransferItem) : TransferItem {
        { item | chosen: true, selected: false, justMoved: true }
      })

      let updatedChosen = if isAsc {
        Array.concat([newChosenItems, chosen])
      } else {
        Array.concat([chosen, newChosenItems])
      }

      next {
        chosen: updatedChosen,
        unChosen: remainingUnChosen
      }

      onTransfer(updatedChosen, remainingUnChosen)
    }
  }

  fun handleTransferAllToLeft : Promise(Void) {
    if disabled {
      next { }
    } else {
      let availableItems = Array.select(chosen, (item : TransferItem) : Bool { !item.disabled })
      let remainingChosen = Array.select(chosen, (item : TransferItem) : Bool { item.disabled })

      let newUnChosenItems = Array.map(availableItems, (item : TransferItem) : TransferItem {
        { item | chosen: false, selected: false, justMoved: true }
      })

      let updatedUnChosen = if isAsc {
        Array.concat([newUnChosenItems, unChosen])
      } else {
        Array.concat([unChosen, newUnChosenItems])
      }

      next {
        chosen: remainingChosen,
        unChosen: updatedUnChosen
      }

      onTransfer(remainingChosen, updatedUnChosen)
    }
  }

  fun handleTransferToLeft : Promise(Void) {
    if disabled {
      next { }
    } else {
      let selectedItems = Array.select(chosen, (item : TransferItem) : Bool { item.selected && !item.disabled })
      let remainingChosen = Array.select(chosen, (item : TransferItem) : Bool { !item.selected || item.disabled })

      let newUnChosenItems = Array.map(selectedItems, (item : TransferItem) : TransferItem {
        { item | chosen: false, selected: false, justMoved: true }
      })

      let updatedUnChosen = if isAsc {
        Array.concat([newUnChosenItems, unChosen])
      } else {
        Array.concat([unChosen, newUnChosenItems])
      }

      next {
        chosen: remainingChosen,
        unChosen: updatedUnChosen
      }

      onTransfer(remainingChosen, updatedUnChosen)
    }
  }

  fun handleSelectAllLeft : Promise(Void) {
    if disabled {
      next { }
    } else {
      let updatedUnChosen = Array.map(unChosen, (item : TransferItem) : TransferItem {
        if item.disabled {
          item
        } else {
          { item | selected: true }
        }
      })
      next { unChosen: updatedUnChosen }
    }
  }

  fun handleSelectAllRight : Promise(Void) {
    if disabled {
      next { }
    } else {
      let updatedChosen = Array.map(chosen, (item : TransferItem) : TransferItem {
        if item.disabled {
          item
        } else {
          { item | selected: true }
        }
      })
      next { chosen: updatedChosen }
    }
  }

  fun handleLeftSearch (value : String) : Promise(Void) {
    next { leftSearchValue: value }
  }

  fun handleRightSearch (value : String) : Promise(Void) {
    next { rightSearchValue: value }
  }

  fun handleLeftSearchKeyDown (event : Html.Event) : Promise(Void) {
    if event.keyCode == 13 {
      locateItem(leftSearchValue, false)
    } else {
      next { }
    }
  }

  fun handleRightSearchKeyDown (event : Html.Event) : Promise(Void) {
    if event.keyCode == 13 {
      locateItem(rightSearchValue, true)
    } else {
      next { }
    }
  }

  fun findItemIndex (items : Array(TransferItem), searchValue : String, currentIndex : Number) : Number {
    if currentIndex >= Array.size(items) {
      -1
    } else {
      let item = Maybe.withDefault(Array.at(items, currentIndex), { value: "", name: "", description: "", chosen: false, selected: false, disabled: false, keywords: [], justMoved: false })
      let lowerSearchValue = String.toLowerCase(searchValue)
      let nameMatch = String.contains(String.toLowerCase(item.name), lowerSearchValue)
      let descriptionMatch = String.contains(String.toLowerCase(item.description), lowerSearchValue)
      let keywordMatch = Array.any(item.keywords, (keyword : String) : Bool {
        String.contains(String.toLowerCase(keyword), lowerSearchValue)
      })

      if nameMatch || descriptionMatch || keywordMatch {
        currentIndex
      } else {
        findItemIndex(items, searchValue, currentIndex + 1)
      }
    }
  }

  fun locateItem (searchValue : String, isChosen : Bool) : Promise(Void) {
    if String.isEmpty(searchValue) {
      next { }
    } else {
      let items = if isChosen { chosen } else { unChosen }
      let foundIndex = findItemIndex(items, searchValue, 0)

      if foundIndex >= 0 {
        let updatedItems = Array.mapWithIndex(items, (item : TransferItem, i : Number) : TransferItem {
          if i == foundIndex {
            { item | justMoved: true }
          } else {
            { item | justMoved: false }
          }
        })

        if isChosen {
          next { chosen: updatedItems }
        } else {
          next { unChosen: updatedItems }
        }

        scrollToIndex(foundIndex, isChosen)
      } else {
        next { }
      }
    }
  }

  fun scrollToIndex (index : Number, isChosen : Bool) : Promise(Void) {
    next { }
  }

  fun filterItems (items : Array(TransferItem), searchValue : String) : Array(TransferItem) {
    if String.isEmpty(searchValue) {
      items
    } else {
      let lowerSearchValue = String.toLowerCase(searchValue)
      Array.select(items, (item : TransferItem) : Bool {
        let nameMatch = String.contains(String.toLowerCase(item.name), lowerSearchValue)
        let descriptionMatch = String.contains(String.toLowerCase(item.description), lowerSearchValue)
        let keywordMatch = Array.any(item.keywords, (keyword : String) : Bool {
          String.contains(String.toLowerCase(keyword), lowerSearchValue)
        })
        nameMatch || descriptionMatch || keywordMatch
      })
    }
  }

  fun hasSelectedItems (items : Array(TransferItem)) : Bool {
    Array.any(items, (item : TransferItem) : Bool { item.selected && !item.disabled })
  }

  fun hasAvailableItems (items : Array(TransferItem)) : Bool {
    Array.any(items, (item : TransferItem) : Bool { !item.disabled })
  }

  fun getItemCount (items : Array(TransferItem)) : String {
    Number.toString(Array.size(items))
  }

  fun getSelectedCount (items : Array(TransferItem)) : String {
    let selected = Array.select(items, (item : TransferItem) : Bool { item.selected && !item.disabled })
    Number.toString(Array.size(selected))
  }

  fun handleDoubleClick (item : TransferItem, isChosen : Bool) : Promise(Void) {
    if enableDoubleClick && !disabled && !item.disabled {
      if isChosen {
        let updatedChosen = Array.select(chosen, (chosenItem : TransferItem) : Bool { chosenItem.value != item.value })
        let transferredItem = { item | chosen: false, selected: false, justMoved: true }
        let updatedUnChosen = if isAsc {
          Array.concat([[transferredItem], unChosen])
        } else {
          Array.concat([unChosen, [transferredItem]])
        }

        next {
          chosen: updatedChosen,
          unChosen: updatedUnChosen
        }

        onTransfer(updatedChosen, updatedUnChosen)
      } else {
        let updatedUnChosen = Array.select(unChosen, (unChosenItem : TransferItem) : Bool { unChosenItem.value != item.value })
        let transferredItem = { item | chosen: true, selected: false, justMoved: true }
        let updatedChosen = if isAsc {
          Array.concat([[transferredItem], chosen])
        } else {
          Array.concat([chosen, [transferredItem]])
        }

        next {
          chosen: updatedChosen,
          unChosen: updatedUnChosen
        }

        onTransfer(updatedChosen, updatedUnChosen)
      }
    } else {
      next { }
    }
  }

  fun getListHeight : String {
    let searchHeight = if showSearch { 42 } else { 0 }
    let contentHeight = height - 60 - searchHeight
    "#{Number.toString(contentHeight)}px"
  }

  style container {
    display: inline-block;
    font-family: inherit;
    transition: all 0.3s ease;
    position: relative;
  }

  style table {
    border-collapse: separate;
    border-spacing: 0;
    width: 520px;
  }

  style header {
    padding: 12px 16px;
    font-weight: 600;
    font-size: 0.875rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 8px 8px 0 0;
    border-width: 1px 1px 0 1px;
    border-style: solid;
  }

  style headerTitle {
    font-weight: 600;
  }

  style checkAllButton {
    font-size: 0.75rem;
    cursor: pointer;
    transition: all 0.2s ease;
    text-decoration: none;
    padding: 4px 8px;
    border-radius: 4px;

    &:hover {
      text-decoration: none;
      opacity: 0.8;
    }
  }

  style searchContainer {
    padding: 8px 12px;
    position: relative;
    border-left: 1px solid;
    border-right: 1px solid;
  }

  style searchInput {
    width: 100%;
    height: 32px;
    padding: 8px 32px 8px 12px;
    border-radius: 6px;
    border-width: 1px;
    border-style: solid;
    font-size: 0.875rem;
    transition: all 0.2s ease;
    outline: none;

    &:focus {
      outline: none;
    }

    &::placeholder {
      font-size: 0.875rem;
    }
  }

  style searchIcon {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    font-size: 1rem;
    transition: color 0.2s ease;
    user-select: none;

    &:hover {
      opacity: 0.7;
    }
  }

  style listContainer {
    border-width: 0 1px 1px 1px;
    border-style: solid;
    border-radius: 0 0 8px 8px;
    overflow: hidden;
  }

  style list {
    margin: 0;
    padding: 0;
    list-style: none;
    overflow-y: auto;
    overflow-x: hidden;
    scroll-behavior: smooth;
  }

  style listItem {
    display: block;
    cursor: pointer;
    transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
    border-bottom-width: 1px;
    border-bottom-style: solid;
    position: relative;

    &:last-child {
      border-bottom: none;
    }

    &:hover {
      transform: translateX(4px);
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    &:active {
      transform: translateX(2px);
    }
  }

  style itemLink {
    display: block;
    padding: 12px 16px;
    text-decoration: none;
    font-size: 0.875rem;
    line-height: 1.4;
    position: relative;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    transition: all 0.2s ease;

    &:hover {
      text-decoration: none;
    }
  }

  style selectedIcon {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    font-weight: 600;
    font-size: 1rem;
  }

  style buttonsContainer {
    width: 60px;
    text-align: center;
    vertical-align: middle;
    padding: 20px 0;
  }

  style transferButton {
    display: block;
    width: 36px;
    height: 36px;
    margin: 0 auto 12px auto;
    border-radius: 8px;
    border-width: 1px;
    border-style: solid;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    text-decoration: none;
    font-size: 1rem;
    line-height: 34px;

    &:last-child {
      margin-bottom: 0;
    }

    &:hover {
      text-decoration: none;
      transform: scale(1.1) rotate(5deg);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    &:active {
      transform: scale(0.95) rotate(0deg);
    }
  }

  style itemCount {
    font-size: 0.75rem;
    opacity: 0.7;
    margin-left: 8px;
  }

  style emptyState {
    text-align: center;
    padding: 40px 20px;
    opacity: 0.5;
    font-size: 0.875rem;
  }

  style disabledContainer {
    opacity: 0.6;
    pointer-events: none;
  }

  style justMovedAnimation {
    animation: highlight 1s ease;
  }

  fun renderSearchBar (value : String, onInput : Function(String, Promise(Void)), onKeyDown : Function(Html.Event, Promise(Void)), onSearchClick : Function(Promise(Void)), placeholder : String, position : String) : Html {
    if showSearch {
      <div::searchContainer
        style="
          background: #{ThemeHelpers.getSurface(currentTheme)};
          border-color: #{ThemeHelpers.getBorderSecondary(currentTheme)};
        "
      >
        <input::searchInput
          type="text"
          value={value}
          placeholder={placeholder}
          onInput={(event : Html.Event) : Promise(Void) { onInput(Dom.getValue(event.target)) }}
          onKeyDown={onKeyDown}
          style="
            background: #{ThemeHelpers.getElevated(currentTheme)};
            border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
            color: #{ThemeHelpers.getTextPrimary(currentTheme)};
          "
        />
        <div::searchIcon
          onClick={(event : Html.Event) : Promise(Void) { onSearchClick() }}
          style="color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
        >
          "🔍"
        </div>
      </div>
    } else {
      <></>
    }
  }

  fun renderItem (item : TransferItem, isChosen : Bool, index : Number) : Html {
    <li::listItem
      key={item.value}
      onClick={(event : Html.Event) : Promise(Void) { handleItemClick(item, isChosen) }}
      onDblClick={(event : Html.Event) : Promise(Void) { handleDoubleClick(item, isChosen) }}
      class={if item.justMoved { "just-moved" } else { "" }}
      title={if enableDoubleClick { "Double-click to transfer" } else { "" }}
      style="
        background: #{
          if item.selected {
            ThemeHelpers.getSelectedBackground(currentTheme)
          } else if item.justMoved {
            ThemeHelpers.getHoverBackground(currentTheme)
          } else {
            "transparent"
          }
        };
        border-color: #{ThemeHelpers.getBorderSecondary(currentTheme)};
      "
    >
      <div::itemLink
        title={if String.isEmpty(item.description) { item.name } else { item.description }}
        style="
          color: #{
            if item.disabled {
              ThemeHelpers.getTextSecondary(currentTheme)
            } else if item.selected {
              ThemeHelpers.getAccent(currentTheme)
            } else {
              ThemeHelpers.getTextPrimary(currentTheme)
            }
          };
          opacity: #{if item.disabled { "0.5" } else { "1" }};
        "
      >
        {item.name}
        {
          if item.selected {
            <span::selectedIcon
              style="color: #{ThemeHelpers.getAccent(currentTheme)};"
            >
              "✓"
            </span>
          } else {
            <></>
          }
        }
      </div>
    </li>
  }

  fun renderList (items : Array(TransferItem), searchValue : String, isChosen : Bool, listId : String) : Html {
    let filteredItems = filterItems(items, searchValue)

    <ul::list
      data-transfer-list={listId}
      style="
        height: #{getListHeight()};
        background: #{ThemeHelpers.getElevated(currentTheme)};
      "
    >
      {
        if Array.isEmpty(filteredItems) {
          <li::emptyState
            style="color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
          >
            {
              if String.isEmpty(searchValue) {
                "No items available"
              } else {
                "No items found matching \"#{searchValue}\""
              }
            }
          </li>
        } else {
          <>
          {
            Array.mapWithIndex(filteredItems, (item : TransferItem, index : Number) : Html {
              renderItem(item, isChosen, index)
            })
          }
          </>
        }
      }
    </ul>
  }

  fun render : Html {
    let leftHasSelected = hasSelectedItems(unChosen)
    let rightHasSelected = hasSelectedItems(chosen)
    let leftHasItems = hasAvailableItems(unChosen)
    let rightHasItems = hasAvailableItems(chosen)

    <div::container
      class={if disabled { "disabled" } else { "" }}
      style="#{if disabled { "opacity: 0.6; pointer-events: none;" } else { "" }}"
    >
      <style>
        "
        @keyframes highlight {
          0% {
            background-color: #{ThemeHelpers.getInfo(currentTheme)};
          }
          100% {
            background-color: transparent;
          }
        }
        .just-moved {
          animation: highlight 1s ease;
        }
        "
      </style>

      <table::table>
        <thead>
          <tr>
            <th>
              <div::header
                style="
                  background: #{ThemeHelpers.getSurface(currentTheme)};
                  border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
                  color: #{ThemeHelpers.getTextPrimary(currentTheme)};
                "
              >
                <div>
                  <span::headerTitle>{leftTitle}</span>
                  <span::itemCount
                    style="color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
                  >
                    {"(#{getItemCount(unChosen)})"}
                  </span>
                </div>
                <a::checkAllButton
                  href="#"
                  onClick={(event : Html.Event) : Promise(Void) {
                    Html.Event.preventDefault(event)
                    handleSelectAllLeft()
                  }}
                  style="
                    color: #{ThemeHelpers.getAccent(currentTheme)};
                    background: #{ThemeHelpers.getHoverBackground(currentTheme)};
                  "
                >
                  {checkAllText}
                </a>
              </div>
            </th>
            <th></th>
            <th>
              <div::header
                style="
                  background: #{ThemeHelpers.getSurface(currentTheme)};
                  border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
                  color: #{ThemeHelpers.getTextPrimary(currentTheme)};
                "
              >
                <div>
                  <span::headerTitle>{rightTitle}</span>
                  <span::itemCount
                    style="color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
                  >
                    {"(#{getItemCount(chosen)})"}
                  </span>
                </div>
                <a::checkAllButton
                  href="#"
                  onClick={(event : Html.Event) : Promise(Void) {
                    Html.Event.preventDefault(event)
                    handleSelectAllRight()
                  }}
                  style="
                    color: #{ThemeHelpers.getAccent(currentTheme)};
                    background: #{ThemeHelpers.getHoverBackground(currentTheme)};
                  "
                >
                  {checkAllText}
                </a>
              </div>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              {renderSearchBar(
                leftSearchValue,
                handleLeftSearch,
                handleLeftSearchKeyDown,
                () : Promise(Void) { locateItem(leftSearchValue, false) },
                searchPlaceholder,
                "left"
              )}
              <div::listContainer
                style="
                  background: #{ThemeHelpers.getElevated(currentTheme)};
                  border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
                "
              >
                {renderList(unChosen, leftSearchValue, false, "left")}
              </div>
            </td>
            <td::buttonsContainer>
              <a::transferButton
                href="#"
                title="Move all items to left"
                onClick={(event : Html.Event) : Promise(Void) {
                  Html.Event.preventDefault(event)
                  handleTransferAllToLeft()
                }}
                style="
                  background: #{
                    if rightHasItems && !disabled {
                      ThemeHelpers.getSurface(currentTheme)
                    } else {
                      ThemeHelpers.getSurface(currentTheme)
                    }
                  };
                  border-color: #{
                    if rightHasItems && !disabled {
                      ThemeHelpers.getBorderPrimary(currentTheme)
                    } else {
                      ThemeHelpers.getBorderPrimary(currentTheme)
                    }
                  };
                  color: #{
                    if rightHasItems && !disabled {
                      ThemeHelpers.getAccent(currentTheme)
                    } else {
                      ThemeHelpers.getTextSecondary(currentTheme)
                    }
                  };
                  cursor: #{if rightHasItems && !disabled { "pointer" } else { "not-allowed" }};
                  opacity: #{if rightHasItems && !disabled { "1" } else { "0.5" }};
                "
              >
                "⇐"
              </a>
              <a::transferButton
                href="#"
                title="Move selected items to left"
                onClick={(event : Html.Event) : Promise(Void) {
                  Html.Event.preventDefault(event)
                  handleTransferToLeft()
                }}
                style="
                  background: #{
                    if rightHasSelected && !disabled {
                      ThemeHelpers.getAccent(currentTheme)
                    } else {
                      ThemeHelpers.getSurface(currentTheme)
                    }
                  };
                  border-color: #{
                    if rightHasSelected && !disabled {
                      ThemeHelpers.getAccent(currentTheme)
                    } else {
                      ThemeHelpers.getBorderPrimary(currentTheme)
                    }
                  };
                  color: #{
                    if rightHasSelected && !disabled {
                      ThemeHelpers.getTextInverse(currentTheme)
                    } else {
                      ThemeHelpers.getTextSecondary(currentTheme)
                    }
                  };
                  cursor: #{if rightHasSelected && !disabled { "pointer" } else { "not-allowed" }};
                  opacity: #{if rightHasSelected && !disabled { "1" } else { "0.5" }};
                "
              >
                "←"
              </a>
              <a::transferButton
                href="#"
                title="Move selected items to right"
                onClick={(event : Html.Event) : Promise(Void) {
                  Html.Event.preventDefault(event)
                  handleTransferToRight()
                }}
                style="
                  background: #{
                    if leftHasSelected && !disabled {
                      ThemeHelpers.getAccent(currentTheme)
                    } else {
                      ThemeHelpers.getSurface(currentTheme)
                    }
                  };
                  border-color: #{
                    if leftHasSelected && !disabled {
                      ThemeHelpers.getAccent(currentTheme)
                    } else {
                      ThemeHelpers.getBorderPrimary(currentTheme)
                    }
                  };
                  color: #{
                    if leftHasSelected && !disabled {
                      ThemeHelpers.getTextInverse(currentTheme)
                    } else {
                      ThemeHelpers.getTextSecondary(currentTheme)
                    }
                  };
                  cursor: #{if leftHasSelected && !disabled { "pointer" } else { "not-allowed" }};
                  opacity: #{if leftHasSelected && !disabled { "1" } else { "0.5" }};
                "
              >
                "→"
              </a>
              <a::transferButton
                href="#"
                title="Move all items to right"
                onClick={(event : Html.Event) : Promise(Void) {
                  Html.Event.preventDefault(event)
                  handleTransferAllToRight()
                }}
                style="
                  background: #{
                    if leftHasItems && !disabled {
                      ThemeHelpers.getSurface(currentTheme)
                    } else {
                      ThemeHelpers.getSurface(currentTheme)
                    }
                  };
                  border-color: #{
                    if leftHasItems && !disabled {
                      ThemeHelpers.getBorderPrimary(currentTheme)
                    } else {
                      ThemeHelpers.getBorderPrimary(currentTheme)
                    }
                  };
                  color: #{
                    if leftHasItems && !disabled {
                      ThemeHelpers.getAccent(currentTheme)
                    } else {
                      ThemeHelpers.getTextSecondary(currentTheme)
                    }
                  };
                  cursor: #{if leftHasItems && !disabled { "pointer" } else { "not-allowed" }};
                  opacity: #{if leftHasItems && !disabled { "1" } else { "0.5" }};
                "
              >
                "⇒"
              </a>
            </td>
            <td>
              {renderSearchBar(
                rightSearchValue,
                handleRightSearch,
                handleRightSearchKeyDown,
                () : Promise(Void) { locateItem(rightSearchValue, true) },
                searchPlaceholder,
                "right"
              )}
              <div::listContainer
                style="
                  background: #{ThemeHelpers.getElevated(currentTheme)};
                  border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
                "
              >
                {renderList(chosen, rightSearchValue, true, "right")}
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  }
}
