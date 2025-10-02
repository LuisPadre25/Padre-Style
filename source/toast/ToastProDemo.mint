component ToastProDemo {
  state toastId : Number = 0
  state position : String = "top-right"
  state toast1 : Bool = false
  state toast2 : Bool = false
  state toast3 : Bool = false
  state toast4 : Bool = false
  state toast5 : Bool = false
  state toast6 : Bool = false
  state toast7 : Bool = false
  state toast8 : Bool = false
  state toastPosition : Bool = false
  state positionMessage : String = ""

  fun showToast1 (event : Html.Event) : Promise(Void) {
    next { toast1: true, toastId: toastId + 1 }
  }

  fun showToast2 (event : Html.Event) : Promise(Void) {
    next { toast2: true, toastId: toastId + 1 }
  }

  fun showToast3 (event : Html.Event) : Promise(Void) {
    next { toast3: true, toastId: toastId + 1 }
  }

  fun showToast4 (event : Html.Event) : Promise(Void) {
    next { toast4: true, toastId: toastId + 1 }
  }

  fun showToast5 (event : Html.Event) : Promise(Void) {
    next { toast5: true, toastId: toastId + 1 }
  }

  fun showToast6 (event : Html.Event) : Promise(Void) {
    next { toast6: true, toastId: toastId + 1 }
  }

  fun showToast7 (event : Html.Event) : Promise(Void) {
    next { toast7: true, toastId: toastId + 1 }
  }

  fun showToast8 (event : Html.Event) : Promise(Void) {
    next { toast8: true, toastId: toastId + 1 }
  }

  fun close1 (id : String) : Promise(Void) {
    next { toast1: false }
  }

  fun close2 (id : String) : Promise(Void) {
    next { toast2: false }
  }

  fun close3 (id : String) : Promise(Void) {
    next { toast3: false }
  }

  fun close4 (id : String) : Promise(Void) {
    next { toast4: false }
  }

  fun close5 (id : String) : Promise(Void) {
    next { toast5: false }
  }

  fun close6 (id : String) : Promise(Void) {
    next { toast6: false }
  }

  fun close7 (id : String) : Promise(Void) {
    next { toast7: false }
  }

  fun close8 (id : String) : Promise(Void) {
    next { toast8: false }
  }

  fun closePosition (id : String) : Promise(Void) {
    next { toastPosition: false }
  }

  fun handleUndo : Promise(Void) {
    `alert('Undo action triggered!')`
    Promise.resolve(void)
  }

  fun handleRetry : Promise(Void) {
    `alert('Retry action triggered!')`
    Promise.resolve(void)
  }

  fun handleView : Promise(Void) {
    `alert('View details triggered!')`
    Promise.resolve(void)
  }

  fun setPositionTopLeft (event : Html.Event) : Promise(Void) {
    next { position: "top-left", toastPosition: false }
    await Timer.timeout(10)
    next { positionMessage: "Posición: Top Left", toastPosition: true, toastId: toastId + 1 }
  }

  fun setPositionTopCenter (event : Html.Event) : Promise(Void) {
    next { position: "top-center", toastPosition: false }
    await Timer.timeout(10)
    next { positionMessage: "Posición: Top Center", toastPosition: true, toastId: toastId + 1 }
  }

  fun setPositionTopRight (event : Html.Event) : Promise(Void) {
    next { position: "top-right", toastPosition: false }
    await Timer.timeout(10)
    next { positionMessage: "Posición: Top Right", toastPosition: true, toastId: toastId + 1 }
  }

  fun setPositionBottomLeft (event : Html.Event) : Promise(Void) {
    next { position: "bottom-left", toastPosition: false }
    await Timer.timeout(10)
    next { positionMessage: "Posición: Bottom Left", toastPosition: true, toastId: toastId + 1 }
  }

  fun setPositionBottomCenter (event : Html.Event) : Promise(Void) {
    next { position: "bottom-center", toastPosition: false }
    await Timer.timeout(10)
    next { positionMessage: "Posición: Bottom Center", toastPosition: true, toastId: toastId + 1 }
  }

  fun setPositionBottomRight (event : Html.Event) : Promise(Void) {
    next { position: "bottom-right", toastPosition: false }
    await Timer.timeout(10)
    next { positionMessage: "Posición: Bottom Right", toastPosition: true, toastId: toastId + 1 }
  }


  fun getPositionStyle : String {
    case (position) {
      "top-left" => "top: 20px; left: 20px; align-items: flex-start;"
      "top-center" => "top: 20px; left: 50%; transform: translateX(-50%); align-items: center;"
      "top-right" => "top: 20px; right: 20px; align-items: flex-end;"
      "bottom-left" => "bottom: 20px; left: 20px; align-items: flex-start;"
      "bottom-center" => "bottom: 20px; left: 50%; transform: translateX(-50%); align-items: center;"
      "bottom-right" => "bottom: 20px; right: 20px; align-items: flex-end;"
      => "top: 20px; right: 20px; align-items: flex-end;"
    }
  }

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
    margin-bottom: 0.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  }

  style subtitle {
    font-size: 1.125rem;
    color: rgba(255, 255, 255, 0.9);
    text-align: center;
    margin-bottom: 2rem;
  }

  style content {
    max-width: 1400px;
    margin: 0 auto;
  }

  style section {
    background: white;
    border-radius: 12px;
    padding: 2rem;
    margin-bottom: 1.5rem;
  }

  style sectionTitle {
    font-size: 1.5rem;
    font-weight: 700;
    color: #333;
    margin-bottom: 1rem;
  }

  style grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
  }

  style button {
    padding: 1rem 1.5rem;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    color: white;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
  }

  style positionBtn {
    padding: 0.75rem;
    border: 2px solid #e5e7eb;
    border-radius: 8px;
    background: white;
    font-size: 0.9rem;
    font-weight: 500;
    color: #374151;
    cursor: pointer;
    transition: all 0.2s ease;

    &:hover {
      border-color: #667eea;
      color: #667eea;
    }
  }

  style activeBtn {
    background: #667eea;
    border-color: #667eea;
    color: white;

    &:hover {
      background: #5568d3;
    }
  }

  style toastContainer {
    position: fixed;
    z-index: 9999;
    display: flex;
    flex-direction: column;
    pointer-events: none;
    gap: 0;
  }

  style toastWrapper {
    pointer-events: auto;
  }

  style badge {
    display: inline-block;
    background: #10b981;
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 12px;
    font-size: 0.875rem;
    font-weight: 600;
    margin-left: 0.5rem;
  }

  fun render : Html {
    <div::container>
      <h1::title>
        "🔔 Toast Pro System"
      </h1>

      <p::subtitle>
        "Sistema completo de notificaciones con queue, posiciones, acciones y animaciones"
        <span::badge>"PRO"</span>
      </p>

      <div::content>
        <div::section>
          <div::sectionTitle>
            "💫 Tipos Básicos"
          </div>

          <div::grid>
            <button::button
              style="background: #10b981;"
              onClick={showToast1}>

              "✓ Success"
            </button>

            <button::button
              style="background: #ef4444;"
              onClick={showToast2}>

              "✕ Error"
            </button>

            <button::button
              style="background: #f59e0b;"
              onClick={showToast3}>

              "⚠ Warning"
            </button>

            <button::button
              style="background: #3b82f6;"
              onClick={showToast4}>

              "ℹ Info"
            </button>
          </div>
        </div>

        <div::section>
          <div::sectionTitle>
            "⚡ Con Acciones"
          </div>

          <div::grid>
            <button::button
              style="background: #8b5cf6;"
              onClick={showToast5}>

              "↩️ Undo Action"
            </button>

            <button::button
              style="background: #ec4899;"
              onClick={showToast6}>

              "🔄 Retry Action"
            </button>

            <button::button
              style="background: #06b6d4;"
              onClick={showToast7}>

              "👀 View Details"
            </button>

            <button::button
              style="background: #14b8a6;"
              onClick={showToast8}>

              "📌 Persistente"
            </button>
          </div>
        </div>

        <div::section>
          <div::sectionTitle>
            "📍 Posición"
          </div>

          <div::grid>
            <button::positionBtn
              class={if (position == "top-left") { "activeBtn" } else { "" }}
              onClick={setPositionTopLeft}>

              "↖ Top Left"
            </button>

            <button::positionBtn
              class={if (position == "top-center") { "activeBtn" } else { "" }}
              onClick={setPositionTopCenter}>

              "↑ Top Center"
            </button>

            <button::positionBtn
              class={if (position == "top-right") { "activeBtn" } else { "" }}
              onClick={setPositionTopRight}>

              "↗ Top Right"
            </button>

            <button::positionBtn
              class={if (position == "bottom-left") { "activeBtn" } else { "" }}
              onClick={setPositionBottomLeft}>

              "↙ Bottom Left"
            </button>

            <button::positionBtn
              class={if (position == "bottom-center") { "activeBtn" } else { "" }}
              onClick={setPositionBottomCenter}>

              "↓ Bottom Center"
            </button>

            <button::positionBtn
              class={if (position == "bottom-right") { "activeBtn" } else { "" }}
              onClick={setPositionBottomRight}>

              "↘ Bottom Right"
            </button>
          </div>
        </div>

      </div>

      <div::toastContainer style={getPositionStyle()}>
        {
          if (toast1) {
            <div::toastWrapper>
              <ToastPro
                id="1"
                message="¡Operación completada exitosamente!"
                type="success"
                duration={3000}
                onClose={close1}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toast2) {
            <div::toastWrapper>
              <ToastPro
                id="2"
                message="Error al procesar la solicitud"
                type="error"
                duration={4000}
                onClose={close2}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toast3) {
            <div::toastWrapper>
              <ToastPro
                id="3"
                message="⚠️ Esta acción no se puede deshacer"
                type="warning"
                duration={3500}
                onClose={close3}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toast4) {
            <div::toastWrapper>
              <ToastPro
                id="4"
                message="Nueva actualización disponible v2.0"
                type="info"
                duration={3000}
                onClose={close4}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toast5) {
            <div::toastWrapper>
              <ToastPro
                id="5"
                message="Archivo eliminado correctamente"
                type="success"
                duration={4000}
                actionLabel="Deshacer"
                actionCallback={handleUndo}
                onClose={close5}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toast6) {
            <div::toastWrapper>
              <ToastPro
                id="6"
                message="Error de conexión con el servidor"
                type="error"
                duration={5000}
                actionLabel="Reintentar"
                actionCallback={handleRetry}
                onClose={close6}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toast7) {
            <div::toastWrapper>
              <ToastPro
                id="7"
                message="Tienes 3 nuevas notificaciones"
                type="info"
                duration={4000}
                actionLabel="Ver"
                actionCallback={handleView}
                customIcon="🔔"
                onClose={close7}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toast8) {
            <div::toastWrapper>
              <ToastPro
                id="8"
                message="Este mensaje permanece hasta que lo cierres"
                type="info"
                duration={0}
                hasProgress={false}
                onClose={close8}/>
            </div>
          } else {
            <></>
          }
        }

        {
          if (toastPosition) {
            <div::toastWrapper>
              <ToastPro
                id={"position-" + Number.toString(toastId)}
                message={positionMessage}
                type="info"
                duration={2000}
                customIcon="📍"
                onClose={closePosition}/>
            </div>
          } else {
            <></>
          }
        }

      </div>
    </div>
  }
}
