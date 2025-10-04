/* Drop Zone Component */
component DropZone {
  /* Properties */
  property children : Array(Html) = []
  property onDrop : Function(String, Promise(Void)) = (id : String) : Promise(Void) { Promise.resolve(void) }
  property label : String = "Drop Here"
  property acceptsItems : Bool = true

  /* State */
  state isOver : Bool = false

  /* Styles */
  style base {
    min-height: 200px;
    padding: 2rem;
    margin: 1rem;
    background: #f8f9fa;
    border: 3px dashed #cbd5e0;
    border-radius: 12px;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 1rem;
  }

  style over {
    background: #eef2ff;
    border-color: #667eea;
    border-style: solid;
    box-shadow: inset 0 0 0 2px #667eea;
    transform: scale(1.02);
  }

  style label {
    font-size: 1.25rem;
    font-weight: 600;
    color: #718096;
    text-align: center;
  }

  style labelOver {
    color: #667eea;
  }

  style content {
    width: 100%;
  }

  /* Event Handlers */
  fun handleDragOver (event : Html.Event) : Promise(Void) {
    /* Prevent default to allow drop */
    `#{event}.preventDefault()`

    if acceptsItems {
      `#{event}.dataTransfer.dropEffect = 'move'`
    } else {
      `#{event}.dataTransfer.dropEffect = 'none'`
    }

    if !isOver {
      next { isOver: true }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleDragLeave (event : Html.Event) : Promise(Void) {
    next { isOver: false }
  }

  fun handleDrop (event : Html.Event) : Promise(Void) {
    /* Prevent default behavior */
    `#{event}.preventDefault()`

    /* Get dragged item id */
    let draggedId =
      `#{event}.dataTransfer.getData('text/plain')` as String

    next { isOver: false }

    if acceptsItems {
      onDrop(draggedId)
    } else {
      Promise.resolve(void)
    }
  }

  /* Render */
  fun render : Html {
    <div::base
      class={
        if isOver {
          "over"
        } else {
          ""
        }
      }
      onDragOver={handleDragOver}
      onDragLeave={handleDragLeave}
      onDrop={handleDrop}>

      <div::label
        class={
          if isOver {
            "labelOver"
          } else {
            ""
          }
        }>

        {label}
      </div>

      <div::content>
        {
          for child of children {
            child
          }
        }
      </div>
    </div>
  }
}
