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
    box-sizing: border-box;

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
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0.5rem 1rem;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 6px;
    font-size: 0.875rem;
    color: rgba(255, 255, 255, 0.9);
    gap: 1rem;
  }

  style fileName {
    flex: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  style removeButton {
    background: none;
    border: none;
    color: rgba(255, 255, 255, 0.7);
    cursor: pointer;
    font-size: 1.25rem;
    line-height: 1;
    padding: 0;
    transition: all 0.2s ease;
    display: flex;
    align-items: center;
    justify-content: center;

    &:hover {
      color: #ef4444;
      transform: scale(1.2);
    }
  }

  style clearButton {
    margin-top: 0.5rem;
    padding: 0.5rem 1rem;
    background: rgba(239, 68, 68, 0.2);
    color: #ef4444;
    border: 1px solid #ef4444;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.875rem;
    font-weight: 500;
    transition: all 0.2s ease;

    &:hover {
      background: rgba(239, 68, 68, 0.3);
      transform: translateY(-1px);
    }
  }

  style hiddenInput {
    display: none;
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    /* Trigger file input click */
    `
    (() => {
      const input = document.querySelector('[data-file-input="true"]');
      if (input) {
        input.click();
      }
    })()
    `
    Promise.never()
  }

  fun handleFileChange (event : Html.Event) : Promise(Void) {
    /* Get selected file names from JavaScript */
    let fileNames =
      `
      (() => {
        const input = event.target;
        const files = Array.from(input.files || []);
        return files.map(f => f.name);
      })()
      ` as Array(String)

    next { selectedFiles: fileNames }
  }

  fun removeFile (index : Number) : Promise(Void) {
    let newFiles =
      Array.mapWithIndex(selectedFiles,
        (file : String, idx : Number) : Maybe(String) {
          if idx == index {
            Maybe.Nothing
          } else {
            Maybe.Just(file)
          }
        })
      |> Array.compact

    next { selectedFiles: newFiles }
  }

  fun clearAllFiles : Promise(Void) {
    /* Reset file input and clear list */
    `
    (() => {
      const input = document.querySelector('[data-file-input="true"]');
      if (input) {
        input.value = '';
      }
    })()
    `
    next { selectedFiles: [] }
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
    <div>
      <input::hiddenInput
        type="file"
        accept={accept}
        disabled={disabled}
        data-file-input="true"
        onChange={handleFileChange}
        multiple="multiple"
      />

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
              {
                Array.mapWithIndex(selectedFiles,
                  (file : String, idx : Number) : Html {
                    <div::fileItem>
                      <span::fileName>file</span>

                      <button::removeButton
                        onClick={(e : Html.Event) { removeFile(idx) }}
                      >
                        "×"
                      </button>
                    </div>
                  })
              }

              <button::clearButton onClick={(e : Html.Event) { clearAllFiles() }}>
                "Clear all files"
              </button>
            </div>
          } else {
            <div/>
          }
        }
      </div>
    </div>
  }
}
