/* Draggable Item Component */
component DraggableItem {
  /* Properties */
  property children : Array(Html) = []
  property id : String = ""
  property onDragStart : Function(String, Promise(Void)) = (id : String) : Promise(Void) { Promise.resolve(void) }
  property onDragEnd : Function(Promise(Void)) = () : Promise(Void) { Promise.resolve(void) }

  /* State */
  state isDragging : Bool = false

  /* Styles */
  style base {
    padding: 1rem;
    margin: 0.5rem;
    background: #ffffff;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    cursor: grab;
    transition: all 0.2s ease;
    user-select: none;

    &:hover {
      border-color: #667eea;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    &:active {
      cursor: grabbing;
    }
  }

  style dragging {
    opacity: 0.5;
    transform: rotate(2deg);
    cursor: grabbing;
  }

  /* Event Handlers */
  fun handleDragStart (event : Html.Event) : Promise(Void) {
    /* Set drag data */
    `#{event}.dataTransfer.effectAllowed = 'move'`
    `#{event}.dataTransfer.setData('text/plain', #{id})`

    next { isDragging: true }
    onDragStart(id)
  }

  fun handleDragEnd (event : Html.Event) : Promise(Void) {
    next { isDragging: false }
    onDragEnd()
  }

  /* Render */
  fun render : Html {
    <div::base
      class={
        if isDragging {
          "dragging"
        } else {
          ""
        }
      }
      draggable="true"
      onDragStart={handleDragStart}
      onDragEnd={handleDragEnd}>

      {
        for child of children {
          child
        }
      }
    </div>
  }
}
