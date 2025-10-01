/* File Upload Component */
component FileUpload {
  property accept : String = "*"
  property disabled : Bool = false

  connect ThemeStore exposing { currentTheme }

  state isDragging : Bool = false
  state selectedFiles : Array(String) = []

  style container {
    width: 100%;
    padding: 2rem;
    border: 2px dashed rgba(255, 255, 255, 0.3);
    border-radius: 12px;
    background: rgba(255, 255, 255, 0.05);
    text-align: center;
    cursor: pointer;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);

    &:hover {
      border-color: #667eea;
      background: rgba(102, 126, 234, 0.1);
    }
  }

  style dragging {
    border-color: #667eea;
    background: rgba(102, 126, 234, 0.15);
    transform: scale(1.02);
  }

  style icon {
    font-size: 3rem;
    margin-bottom: 1rem;
  }

  style text {
    font-size: 1rem;
    color: rgba(255, 255, 255, 0.9);
    margin-bottom: 0.5rem;
  }

  style hint {
    font-size: 0.875rem;
    color: rgba(255, 255, 255, 0.6);
  }

  style fileList {
    margin-top: 1rem;
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }

  style fileItem {
    padding: 0.5rem 1rem;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 6px;
    font-size: 0.875rem;
    color: rgba(255, 255, 255, 0.9);
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  fun handleDragOver (event : Html.Event) : Promise(Void) {
    next { isDragging: true }
  }

  fun handleDragLeave (event : Html.Event) : Promise(Void) {
    next { isDragging: false }
  }

  fun handleDrop (event : Html.Event) : Promise(Void) {
    next { isDragging: false }
  }

  fun getContainerStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-color: #{if isDragging {
      "#667eea"
    } else {
      ThemeHelpers.getBorderPrimary(currentTheme)
    }};
    "
  }

  fun render : Html {
    <div::container
      class={
        if isDragging {
          "dragging"
        } else {
          ""
        }
      }
      style={getContainerStyles()}
      onClick={handleClick}
      onDragOver={handleDragOver}
      onDragLeave={handleDragLeave}
      onDrop={handleDrop}
    >
      <div::icon>"📁"</div>
      <div::text>"Click to upload or drag and drop"</div>
      <div::hint>"Supported formats: #{accept}"</div>

      {
        if Array.size(selectedFiles) > 0 {
          <div::fileList>
            for file of selectedFiles {
              <div::fileItem>file</div>
            }
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
