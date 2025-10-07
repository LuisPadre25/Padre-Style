/* Collapse - Professional collapsible panels component
 * Features: Accordion mode, Dynamic items, Animations, Form integration
 * Mobile-first responsive design
 */

component Collapse {
  /* Properties */
  property items : Array(CollapseItem) = []
  property active : Array(String) = []
  property accordion : Bool = false
  property border : Bool = true
  property animated : Bool = true
  property animationDuration : Number = 0.3
  property width : String = "100%"  // "auto", "100%", "500px", etc.
  property minWidth : String = "420px"  // Minimum width

  /* Events */
  property onChange : Function(CollapseChangeEvent, Promise(Void)) = (event : CollapseChangeEvent) : Promise(Void) { Promise.never() }
  property onRemove : Function(CollapseRemoveEvent, Promise(Void)) = (event : CollapseRemoveEvent) : Promise(Void) { Promise.never() }

  /* State */
  state activeItems : Array(String) = []

  /* Lifecycle */
  fun componentDidMount : Promise(Void) {
    next { activeItems: active }
  }

  fun componentDidUpdate : Promise(Void) {
    if activeItems != active {
      next { activeItems: active }
    } else {
      Promise.never()
    }
  }

  /* Check if item is active */
  fun isActive (name : String) : Bool {
    `
    (() => {
      const activeItems = #{activeItems};
      return activeItems.includes(#{name});
    })()
    `
  }

  /* Toggle item */
  fun handleToggle (item : CollapseItem, index : Number) : Promise(Void) {
    if item.disabled {
      Promise.never()
    } else if isActive(item.name) {
      /* Currently active - close it */
      if accordion {
        next { activeItems: [] }
        onChange({
          name: item.name,
          active: [],
          expanded: false
        })
      } else {
        `
        (() => {
          const activeItems = #{activeItems};
          const itemName = #{item.name};
          const newActive = activeItems.filter(item => item !== itemName);
          #{next { activeItems: `newActive` }};
        })()
        `

        `
        (() => {
          const activeItems = #{activeItems};
          const itemName = #{item.name};
          const newActive = activeItems.filter(item => item !== itemName);
          return newActive;
        })()
        `
        |> (newActive : Array(String)) : Promise(Void) {
          onChange({
            name: item.name,
            active: newActive,
            expanded: false
          })
        }
      }
    } else {
      /* Not active - open it */
      if accordion {
        next { activeItems: [item.name] }
        onChange({
          name: item.name,
          active: [item.name],
          expanded: true
        })
      } else {
        `
        (() => {
          const activeItems = #{activeItems};
          const itemName = #{item.name};
          const newActive = [...activeItems, itemName];
          #{next { activeItems: `newActive` }};
        })()
        `

        `
        (() => {
          const activeItems = #{activeItems};
          const itemName = #{item.name};
          const newActive = [...activeItems, itemName];
          return newActive;
        })()
        `
        |> (newActive : Array(String)) : Promise(Void) {
          onChange({
            name: item.name,
            active: newActive,
            expanded: true
          })
        }
      }
    }
  }

  /* Remove item */
  fun handleRemove (item : CollapseItem, index : Number, event : Html.Event) : Promise(Void) {
    `
    (() => {
      #{event}.stopPropagation();
    })()
    `

    onRemove({
      name: item.name,
      index: index
    })
  }

  /* Styles */
  style container {
    display: block;
    width: #{width};
    min-width: #{minWidth};
    border-radius: 8px;
    overflow: hidden;
    box-sizing: border-box;

    if border {
      border: 1px solid #d9d9d9;
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.03);
    }
  }

  style item (showBorder : Bool) {
    display: block;
    background: #fff;
    position: relative;
    width: 100%;
    box-sizing: border-box;

    if showBorder {
      border-bottom: 1px solid #d9d9d9;
    }
  }

  style header (active : Bool, disabled : Bool) {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px;
    cursor: pointer;
    gap: 16px;
    user-select: none;
    position: relative;
    background: #fff;
    width: 100%;
    box-sizing: border-box;

    if animated {
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    } else {
      transition: none;
    }

    @media (min-width: 768px) {
      padding: 18px 20px;
    }

    if disabled {
      cursor: not-allowed;
      opacity: 0.4;
      background: #fafafa;
    } else {
      &:hover {
        background: #fafafa;
      }

      &:active {
        background: #f5f5f5;
      }
    }
  }

  style headerLeft {
    display: flex;
    align-items: center;
    gap: 14px;
    flex: 1;
    min-width: 0;
  }

  style chevron (active : Bool, disabled : Bool) {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    position: relative;

    if animated {
      transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    } else {
      transition: none;
    }

    &::before {
      content: "";
      position: absolute;
      width: 8px;
      height: 8px;
      border-right: 2px solid #8c8c8c;
      border-bottom: 2px solid #8c8c8c;
      transform: rotate(45deg);

      if animated {
        transition: border-color 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      } else {
        transition: none;
      }
    }

    if disabled {
      &::before {
        border-color: #d9d9d9;
      }
    }

    if active {
      transform: rotate(180deg);

      &::before {
        border-color: #1890ff;
      }
    }
  }

  style title (active : Bool, disabled : Bool) {
    font-size: 15px;
    font-weight: 500;
    color: #262626;
    flex: 1;
    min-width: 0;

    if animated {
      transition: color 0.3s ease;
    } else {
      transition: none;
    }

    @media (min-width: 768px) {
      font-size: 16px;
    }

    if disabled {
      color: #bfbfbf;
    }

    if active {
      color: #1890ff;
    }
  }

  style headerRight {
    display: flex;
    align-items: center;
    gap: 12px;
    flex-shrink: 0;
  }

  style removeButton {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    border-radius: 6px;
    background: transparent;
    border: 1px solid #d9d9d9;
    cursor: pointer;
    color: #595959;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    font-size: 20px;
    font-weight: 300;
    line-height: 1;

    &:hover {
      background: #ff4d4f;
      border-color: #ff4d4f;
      color: #fff;
      transform: scale(1.1);
    }

    &:active {
      transform: scale(0.95);
    }
  }

  style contentWrapper (active : Bool) {
    display: block;
    max-height: 0;
    overflow: hidden;
    opacity: 0;
    background: #fafafa;
    width: 100%;
    box-sizing: border-box;

    if animated {
      transition: max-height #{Number.toString(animationDuration)}s cubic-bezier(0.4, 0, 0.2, 1), opacity #{Number.toString(animationDuration)}s ease;
    } else {
      transition: none;
    }

    if active {
      max-height: 2000px;
      opacity: 1;
    }
  }

  style content {
    display: block;
    padding: 0 16px 20px 46px;
    color: #595959;
    font-size: 14px;
    line-height: 1.8;
    background: #fff;
    width: 100%;
    box-sizing: border-box;

    @media (min-width: 768px) {
      padding: 0 20px 24px 50px;
      font-size: 15px;
    }
  }

  /* Check if should show border for item */
  fun shouldShowBorder (index : Number) : Bool {
    border && index < (Array.size(items) - 1)
  }

  /* Render */
  fun render : Html {
    <div::container>
      for item, index of items {
        <div::item(shouldShowBorder(index)) key={item.name}>
          <div::header(isActive(item.name), item.disabled)
            onClick={(event : Html.Event) { handleToggle(item, index) }}>

            <div::headerLeft>
              <div::chevron(isActive(item.name), item.disabled)/>

              <div::title(isActive(item.name), item.disabled)>{item.title}</div>
            </div>

            <div::headerRight>
              if String.isNotEmpty(item.badge) {
                <Badge
                  count={
                    Number.fromString(item.badge)
                    |> Maybe.withDefault(0)
                  }
                  max={99}
                  showZero={false}
                  variant="primary"
                  size="small"
                  standalone={true}
                  text={item.badge}/>
              } else {
                <></>
              }

              if item.removable {
                <button::removeButton
                  onClick={(event : Html.Event) { handleRemove(item, index, event) }}>
                  "×"
                </button>
              } else {
                <></>
              }
            </div>
          </div>

          <div::contentWrapper(isActive(item.name))>
            <div::content>
              {item.content}
            </div>
          </div>
        </div>
      }
    </div>
  }
}
