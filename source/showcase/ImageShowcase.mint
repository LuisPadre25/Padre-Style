/* ImageShowcase - Demostración de componentes de imagen */
component ImageShowcase {
  state lightboxOpen : Bool = false
  state selectedImage : String = ""

  connect ThemeStore exposing { currentTheme }

  style showcase {
    padding: 2rem;
    min-height: 100vh;
  }

  fun getShowcaseStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
    "
  }

  style header {
    margin-bottom: 3rem;
  }

  style title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  style subtitle {
    font-size: 1.25rem;
    opacity: 0.7;
  }

  fun getSubtitleStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  style section {
    margin-bottom: 4rem;
  }

  style sectionTitle {
    font-size: 1.75rem;
    font-weight: 600;
    margin-bottom: 1.5rem;
    padding-bottom: 0.75rem;
    border-bottom: 2px solid;
  }

  fun getSectionTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  style description {
    margin-bottom: 1.5rem;
    font-size: 1rem;
    line-height: 1.6;
  }

  fun getDescriptionStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  style grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
  }

  style demoCard {
    border-radius: 16px;
    padding: 1.5rem;
    backdrop-filter: blur(10px);
  }

  fun getDemoCardStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style cardTitle {
    font-size: 1.25rem;
    font-weight: 600;
    margin-bottom: 1rem;
  }

  fun getCardTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun getSampleImages : Array(String) {
    [
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
      "https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800",
      "https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=800",
      "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800",
      "https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=800"
    ]
  }

  fun getSampleAlts : Array(String) {
    [
      "Montañas nevadas",
      "Bosque niebla",
      "Naturaleza verde",
      "Camino bosque",
      "Lago montañas"
    ]
  }

  fun handleImageClick (image : String, event : Html.Event) : Promise(Void) {
    sequence {
      next { selectedImage: image, lightboxOpen: true }
    }
  }

  fun closeLightbox (event : Html.Event) : Promise(Void) {
    next { lightboxOpen: false }
  }

  fun render : Html {
    <div::showcase style={getShowcaseStyles()}>
      <div::header>
        <h1::title>"🖼️ Image Components"</h1>
        <p::subtitle style={getSubtitleStyles()}>
          "Componentes avanzados para manejo de imágenes con carruseles, zoom, lightbox y comparación"
        </p>
      </div>

      /* Sección: Carrusel de Imágenes */
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"📸 Carrusel de Imágenes"</h2>
        <p::description style={getDescriptionStyles()}>
          "Carrusel con navegación, thumbnails, indicadores y zoom. Soporta autoplay y pausa."
        </p>

        <div::demoCard style={getDemoCardStyles()}>
          <h3::cardTitle style={getCardTitleStyles()}>"Carrusel con Thumbnails"</h3>
          <ImageCarousel
            images={getSampleImages()}
            alts={getSampleAlts()}
            showThumbnails={true}
            enableZoom={true}
            autoPlay={false}
          />
        </div>
      </div>

      /* Sección: Imagen con Zoom */
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"🔍 Zoom Avanzado"</h2>
        <p::description style={getDescriptionStyles()}>
          "Imagen con zoom interactivo. Haz clic para hacer zoom y mueve el mouse para explorar."
        </p>

        <div::grid>
          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"Zoom 2x"</h3>
            <ImageZoom
              src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200"
              alt="Montañas con zoom"
              height="400px"
              zoomLevel={2}
            />
          </div>

          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"Zoom 3x"</h3>
            <ImageZoom
              src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1200"
              alt="Bosque con zoom"
              height="400px"
              zoomLevel={3}
            />
          </div>
        </div>
      </div>

      /* Sección: Comparación de Imágenes */
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"⚖️ Comparación de Imágenes"</h2>
        <p::description style={getDescriptionStyles()}>
          "Compara dos imágenes con un slider interactivo. Perfecto para antes/después."
        </p>

        <div::demoCard style={getDemoCardStyles()}>
          <h3::cardTitle style={getCardTitleStyles()}>"Antes y Después"</h3>
          <ImageComparison
            beforeImage="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200"
            afterImage="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200&sat=-100"
            beforeLabel="Original"
            afterLabel="Blanco y Negro"
          />
        </div>
      </div>

      /* Sección: Galería con Lightbox */
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"🎨 Galería con Lightbox"</h2>
        <p::description style={getDescriptionStyles()}>
          "Haz clic en cualquier imagen para verla en pantalla completa con controles de zoom y rotación."
        </p>

        <div::grid>
          {
            Array.map(getSampleImages(),
              (image : String) {
                <div::demoCard
                  style="#{getDemoCardStyles()} cursor: pointer;"
                  onClick={(event : Html.Event) { handleImageClick(image, event) }}
                >
                  <img
                    src={image}
                    alt="Gallery image"
                    style="width: 100%; height: 300px; object-fit: cover; border-radius: 8px;"
                  />
                </div>
              })
          }
        </div>
      </div>

      /* Sección: Características */
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"✨ Características"</h2>

        <div::grid>
          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"🎯 ImageCarousel"</h3>
            <ul style="#{getDescriptionStyles()} list-style: disc; padding-left: 1.5rem;">
              <li>"Navegación con botones prev/next"</li>
              <li>"Thumbnails clickeables"</li>
              <li>"Indicadores de posición"</li>
              <li>"Autoplay con pausa"</li>
              <li>"Zoom integrado"</li>
              <li>"Diseño responsive"</li>
            </ul>
          </div>

          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"🔍 ImageZoom"</h3>
            <ul style="#{getDescriptionStyles()} list-style: disc; padding-left: 1.5rem;">
              <li>"Zoom con clic"</li>
              <li>"Seguimiento del mouse"</li>
              <li>"Niveles de zoom configurables"</li>
              <li>"Indicador de nivel de zoom"</li>
              <li>"Animaciones suaves"</li>
              <li>"Modo contain/cover"</li>
            </ul>
          </div>

          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"🌟 ImageLightbox"</h3>
            <ul style="#{getDescriptionStyles()} list-style: disc; padding-left: 1.5rem;">
              <li>"Modal de pantalla completa"</li>
              <li>"Controles de zoom +/-"</li>
              <li>"Rotación de imagen"</li>
              <li>"Reset rápido"</li>
              <li>"Cerrar con clic fuera"</li>
              <li>"Diseño glassmorphic"</li>
            </ul>
          </div>

          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"⚖️ ImageComparison"</h3>
            <ul style="#{getDescriptionStyles()} list-style: disc; padding-left: 1.5rem;">
              <li>"Slider interactivo"</li>
              <li>"Comparación lado a lado"</li>
              <li>"Etiquetas personalizables"</li>
              <li>"Handle visual"</li>
              <li>"Cursor personalizado"</li>
              <li>"Perfecto para antes/después"</li>
            </ul>
          </div>
        </div>
      </div>

      /* Sección: Uso */
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"📝 Cómo Usar"</h2>

        <div::grid>
          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"Carrusel Básico"</h3>
            <pre
              style="
                #{getDescriptionStyles()}
                padding: 1rem;
                border-radius: 8px;
                overflow-x: auto;
                background: rgba(0, 0, 0, 0.2);
                font-family: 'Fira Code', monospace;
                font-size: 0.875rem;
              "
            >
              {
                "<ImageCarousel\n  images={[\n    \"image1.jpg\",\n    \"image2.jpg\"\n  ]}\n  showThumbnails={true}\n  enableZoom={true}\n/>"
              }
            </pre>
          </div>

          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"Zoom Simple"</h3>
            <pre
              style="
                #{getDescriptionStyles()}
                padding: 1rem;
                border-radius: 8px;
                overflow-x: auto;
                background: rgba(0, 0, 0, 0.2);
                font-family: 'Fira Code', monospace;
                font-size: 0.875rem;
              "
            >
              {
                "<ImageZoom\n  src=\"image.jpg\"\n  alt=\"Imagen con zoom\"\n  zoomLevel={2}\n  height=\"500px\"\n/>"
              }
            </pre>
          </div>

          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"Lightbox"</h3>
            <pre
              style="
                #{getDescriptionStyles()}
                padding: 1rem;
                border-radius: 8px;
                overflow-x: auto;
                background: rgba(0, 0, 0, 0.2);
                font-family: 'Fira Code', monospace;
                font-size: 0.875rem;
              "
            >
              {
                "<ImageLightbox\n  src={selectedImage}\n  isOpen={lightboxOpen}\n  onClose={closeLightbox}\n/>"
              }
            </pre>
          </div>

          <div::demoCard style={getDemoCardStyles()}>
            <h3::cardTitle style={getCardTitleStyles()}>"Comparación"</h3>
            <pre
              style="
                #{getDescriptionStyles()}
                padding: 1rem;
                border-radius: 8px;
                overflow-x: auto;
                background: rgba(0, 0, 0, 0.2);
                font-family: 'Fira Code', monospace;
                font-size: 0.875rem;
              "
            >
              {
                "<ImageComparison\n  beforeImage=\"before.jpg\"\n  afterImage=\"after.jpg\"\n  beforeLabel=\"Antes\"\n  afterLabel=\"Después\"\n/>"
              }
            </pre>
          </div>
        </div>
      </div>

      /* Lightbox Component */
      <ImageLightbox
        src={selectedImage}
        alt="Imagen ampliada"
        isOpen={lightboxOpen}
        onClose={closeLightbox}
      />
    </div>
  }
}
