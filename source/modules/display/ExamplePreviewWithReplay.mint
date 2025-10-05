/* ExamplePreviewWithReplay - Wrapper for animation examples with replay control */

component ExamplePreviewWithReplay {
  property content : Html = Html.empty()

  state replayKey : Number = 0

  fun replayAnimation : Promise(Void) {
    next { replayKey: replayKey + 1 }
  }

  style container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 20px;
    width: 100%;
  }

  style previewArea {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 200px;
  }

  style replayButton {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    background: linear-gradient(135deg, #1989fa 0%, #0c6edb 100%);
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(25, 137, 250, 0.3);

    &:hover {
      transform: translateY(-2px) scale(1.05);
      box-shadow: 0 6px 16px rgba(25, 137, 250, 0.4);
    }

    &:active {
      transform: translateY(0) scale(0.98);
    }
  }

  fun render : Html {
    <div::container>
      <div::previewArea key={Number.toString(replayKey)}>
        {content}
      </div>
      <button::replayButton onClick={replayAnimation}>
        "🔄 Replay Animation"
      </button>
    </div>
  }
}
