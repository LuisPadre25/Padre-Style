/* Drag & Drop Demo - Kanban Style */
component DragDropDemo {
  /* State */
  state todoItems : Array(String) = [
    "Design homepage",
    "Write documentation",
    "Fix bugs"
  ]

  state inProgressItems : Array(String) = [
    "Implement drag & drop",
    "Code review"
  ]

  state doneItems : Array(String) = [
    "Setup project",
    "Create components"
  ]

  state currentDragging : String = ""

  /* Styles */
  style container {
    padding: 2rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
  }

  style title {
    font-size: 2.5rem;
    font-weight: 800;
    color: white;
    text-align: center;
    margin-bottom: 1rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  }

  style subtitle {
    font-size: 1.125rem;
    color: rgba(255, 255, 255, 0.9);
    text-align: center;
    margin-bottom: 2rem;
  }

  style board {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 1.5rem;
    max-width: 1400px;
    margin: 0 auto;
  }

  style columnHeader {
    font-size: 1.25rem;
    font-weight: 700;
    color: #2d3748;
    margin-bottom: 0.5rem;
    padding: 0.75rem 1rem;
    background: white;
    border-radius: 8px 8px 0 0;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  style itemText {
    font-size: 1rem;
    color: #2d3748;
    font-weight: 500;
  }

  style itemIcon {
    margin-right: 0.5rem;
    font-size: 1.25rem;
  }

  style emptyState {
    padding: 2rem;
    text-align: center;
    color: #a0aec0;
    font-style: italic;
  }

  /* Event Handlers */
  fun handleDragStart (id : String) : Promise(Void) {
    next { currentDragging: id }
  }

  fun handleDragEnd : Promise(Void) {
    next { currentDragging: "" }
  }

  fun moveToTodo (itemId : String) : Promise(Void) {
    /* Remove from other lists */
    let newInProgress =
      Array.select(inProgressItems, (item : String) : Bool { item != itemId })

    let newDone =
      Array.select(doneItems, (item : String) : Bool { item != itemId })

    /* Add to todo if not already there */
    let newTodo =
      if Array.contains(todoItems, itemId) {
        todoItems
      } else {
        Array.push(todoItems, itemId)
      }

    next {
      todoItems: newTodo,
      inProgressItems: newInProgress,
      doneItems: newDone
    }
  }

  fun moveToInProgress (itemId : String) : Promise(Void) {
    /* Remove from other lists */
    let newTodo =
      Array.select(todoItems, (item : String) : Bool { item != itemId })

    let newDone =
      Array.select(doneItems, (item : String) : Bool { item != itemId })

    /* Add to in progress if not already there */
    let newInProgress =
      if Array.contains(inProgressItems, itemId) {
        inProgressItems
      } else {
        Array.push(inProgressItems, itemId)
      }

    next {
      todoItems: newTodo,
      inProgressItems: newInProgress,
      doneItems: newDone
    }
  }

  fun moveToDone (itemId : String) : Promise(Void) {
    /* Remove from other lists */
    let newTodo =
      Array.select(todoItems, (item : String) : Bool { item != itemId })

    let newInProgress =
      Array.select(inProgressItems, (item : String) : Bool { item != itemId })

    /* Add to done if not already there */
    let newDone =
      if Array.contains(doneItems, itemId) {
        doneItems
      } else {
        Array.push(doneItems, itemId)
      }

    next {
      todoItems: newTodo,
      inProgressItems: newInProgress,
      doneItems: newDone
    }
  }

  /* Render */
  fun render : Html {
    <div::container>
      <h1::title>
        "🎯 Drag & Drop Kanban Board"
      </h1>

      <p::subtitle>
        "Drag tasks between columns - Built with Mint Lang"
      </p>

      <div::board>
        /* TODO Column */
        <div>
          <div::columnHeader>
            "📋 To Do"
          </div>

          <DropZone
            label="Drop tasks here"
            onDrop={moveToTodo}>

            {
              if Array.isEmpty(todoItems) {
                <div::emptyState>
                  "No tasks yet"
                </div>
              } else {
                <></>
              }
            }

            {
              for item of todoItems {
                <DraggableItem
                  id={item}
                  onDragStart={handleDragStart}
                  onDragEnd={handleDragEnd}>

                  <span::itemIcon>
                    "⭕"
                  </span>

                  <span::itemText>
                    {item}
                  </span>
                </DraggableItem>
              }
            }
          </DropZone>
        </div>

        /* IN PROGRESS Column */
        <div>
          <div::columnHeader>
            "🔄 In Progress"
          </div>

          <DropZone
            label="Drop tasks here"
            onDrop={moveToInProgress}>

            {
              if Array.isEmpty(inProgressItems) {
                <div::emptyState>
                  "No tasks in progress"
                </div>
              } else {
                <></>
              }
            }

            {
              for item of inProgressItems {
                <DraggableItem
                  id={item}
                  onDragStart={handleDragStart}
                  onDragEnd={handleDragEnd}>

                  <span::itemIcon>
                    "🔄"
                  </span>

                  <span::itemText>
                    {item}
                  </span>
                </DraggableItem>
              }
            }
          </DropZone>
        </div>

        /* DONE Column */
        <div>
          <div::columnHeader>
            "✅ Done"
          </div>

          <DropZone
            label="Drop tasks here"
            onDrop={moveToDone}>

            {
              if Array.isEmpty(doneItems) {
                <div::emptyState>
                  "No completed tasks"
                </div>
              } else {
                <></>
              }
            }

            {
              for item of doneItems {
                <DraggableItem
                  id={item}
                  onDragStart={handleDragStart}
                  onDragEnd={handleDragEnd}>

                  <span::itemIcon>
                    "✅"
                  </span>

                  <span::itemText>
                    {item}
                  </span>
                </DraggableItem>
              }
            }
          </DropZone>
        </div>
      </div>
    </div>
  }
}
