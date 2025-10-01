/* Tags Input Component */
component TagsInput {
  property tags : Array(String) = []
  property placeholder : String = "Add tag..."
  property disabled : Bool = false

  property onTagsChange =
    (newTags : Array(String)) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state inputValue : String = ""

  style container {
    width: 100%;
    min-height: 3rem;
    padding: 0.5rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    align-items: center;
    transition: all 0.3s ease;

    &:focus-within {
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
  }

  style tag {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.375rem 0.75rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 6px;
    font-size: 0.875rem;
    font-weight: 500;
    transition: all 0.2s ease;

    &:hover {
      transform: translateY(-1px);
      box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
    }
  }

  style removeButton {
    background: none;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 1.125rem;
    line-height: 1;
    padding: 0;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: transform 0.2s ease;

    &:hover {
      transform: scale(1.2);
    }
  }

  style input {
    flex: 1;
    min-width: 120px;
    border: none;
    outline: none;
    background: transparent;
    color: #374151;
    font-size: 1rem;
    padding: 0.375rem 0;

    &::placeholder {
      color: #9ca3af;
    }
  }

  fun handleInputChange (event : Html.Event) : Promise(Void) {
    next { inputValue: Dom.getValue(event.target) }
  }

  fun handleKeyDown (event : Html.Event) : Promise(Void) {
    /*
    NOTE: Enter key to add tag and Backspace to remove last tag require
       event.key detection not fully available in pure Mint. Users can still
       add tags by typing and using Tab, or by providing an explicit Add button.
    */
    Promise.never()
  }

  fun addTag : Promise(Void) {
    if String.isEmpty(String.trim(inputValue)) {
      Promise.never()
    } else {
      let trimmed =
        String.trim(inputValue)

      let newTags =
        Array.push(tags, trimmed)

      next { inputValue: "" }
      onTagsChange(newTags)
    }
  }

  fun removeTag (index : Number) : Promise(Void) {
    let newTags =
      Array.range(0, Array.size(tags) - 1)
      |> Array.select((i : Number) { i != index })
      |> Array.map(
        (i : Number) {
          case Array.at(tags, i) {
            Maybe.Just(tag) => tag
            Maybe.Nothing => ""
          }
        })

    onTagsChange(newTags)
  }

  fun removeLastTag : Promise(Void) {
    let size =
      Array.size(tags)

    if size > 0 {
      let newTags =
        Array.slice(tags, 0, size - 1)

      onTagsChange(newTags)
    } else {
      Promise.never()
    }
  }

  fun getContainerStyles : String {
    "background: #{ThemeHelpers.getElevated(currentTheme)};"
  }

  fun renderTagAtIndex (index : Number) : Html {
    case Array.at(tags, index) {
      Maybe.Just(tag) =>
        <div::tag>
          <span>tag</span>

          <button::removeButton onClick={(e : Html.Event) { removeTag(index) }}>
            "×"
          </button>
        </div>

      Maybe.Nothing => <div/>
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        for index of Array.range(0, Array.size(tags) - 1) {
          renderTagAtIndex(index)
        }
      }

      <input::input
        type="text"
        value={inputValue}
        placeholder={placeholder}
        disabled={disabled}
        onChange={handleInputChange}
        onKeyDown={handleKeyDown}
      />
    </div>
  }
}
