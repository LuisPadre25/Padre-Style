component MediaShowcase {
  state lightboxOpen : Bool = false
  state selectedImage : String = ""
  state carouselAutoPlay : Bool = false
  state advancedLightboxOpen : Bool = false
  state advancedLightboxIndex : Number = 0

  connect ThemeStore exposing { currentTheme }

  style tabContent {
    margin-top: 2rem;
  }

  style sectionTitle {
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 2rem;
    text-align: center;
  }

  fun getSectionTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style demoGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 2.5rem;
    margin: 2rem 0;
    width: 100%;
    box-sizing: border-box;
  }

  style fullWidthCard {
    grid-column: 1 / -1;
  }

  style subsectionTitle {
    font-size: 1.5rem;
    font-weight: 600;
    margin: 3rem 0 1.5rem 0;
    padding-bottom: 0.75rem;
    border-bottom: 2px solid;
  }

  fun getSubsectionTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
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
      "Montañas nevadas al atardecer",
      "Bosque con niebla matinal",
      "Naturaleza verde y exuberante",
      "Camino serpenteante en el bosque",
      "Lago cristalino entre montañas"
    ]
  }

  fun handleImageClick (image : String, event : Html.Event) : Promise(Void) {
    next { selectedImage: image, lightboxOpen: true }
  }

  fun closeLightbox (event : Html.Event) : Promise(Void) {
    next { lightboxOpen: false }
  }

  fun toggleAutoPlay (event : Html.Event) : Promise(Void) {
    next { carouselAutoPlay: !carouselAutoPlay }
  }

  fun openAdvancedLightbox (index : Number, event : Html.Event) : Promise(Void) {
    next { advancedLightboxOpen: true, advancedLightboxIndex: index }
  }

  fun closeAdvancedLightbox (event : Html.Event) : Promise(Void) {
    next { advancedLightboxOpen: false }
  }

  fun render : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"🖼️ Media Components"</h3>

      <p
        style="text-align: center; margin-bottom: 2rem; color: #{ThemeHelpers.getTextSecondary(
          currentTheme)};"
      >"Componentes avanzados para manejo de imágenes, galerías, zoom y multimedia"</p>

      /* Sección: Carrusel de Imágenes */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"📸 Image Carousel"</h4>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="Carrusel con Thumbnails y Zoom">
            <p
              style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >"Carrusel interactivo con navegación, thumbnails clickeables, indicadores y zoom integrado"</p>

            <ImageCarousel
              images={getSampleImages()}
              alts={getSampleAlts()}
              showThumbnails={true}
              enableZoom={true}
              autoPlay={carouselAutoPlay}
              interval={3000}
            />

            <Flex justify="center" gap="1rem">
              <Button onClick={toggleAutoPlay} variant="secondary">
                {
                  if carouselAutoPlay {
                    "⏸ Pausar Autoplay"
                  } else {
                    "▶ Activar Autoplay"
                  }
                }
              </Button>
            </Flex>

            <p
              style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)};"
            >
              "✨ Características: Navegación con flechas, thumbnails, indicadores, zoom con clic, autoplay opcional"
            </p>
          </Card>
        </div>
      </div>

      /* Sección: Zoom Avanzado */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🔍 Image Zoom"</h4>

      <div::demoGrid>
        <Card title="Zoom Interactivo 2x">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Haz clic en la imagen para activar el zoom y mueve el mouse para explorar"</p>

          <ImageZoom
            src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200"
            alt="Montañas con zoom 2x"
            height="400px"
            zoomLevel={2}
          />

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)};"
          >"🎯 Nivel de zoom: 2x"</p>
        </Card>

        <Card title="Zoom Avanzado 3x">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Mayor nivel de zoom para ver detalles finos de la imagen"</p>

          <ImageZoom
            src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1200"
            alt="Bosque con zoom 3x"
            height="400px"
            zoomLevel={3}
          />

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)};"
          >"🎯 Nivel de zoom: 3x"</p>
        </Card>
      </div>

      /* Sección: Comparación de Imágenes */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"⚖️ Image Comparison"</h4>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="Antes y Después">
            <p
              style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >"Compara dos imágenes arrastrando el slider. Perfecto para mostrar cambios, ediciones o transformaciones"</p>

            <ImageComparison
              beforeImage="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200"
              afterImage="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200&sat=-100"
              beforeLabel="🎨 Original"
              afterLabel="🖤 Blanco y Negro"
            />

            <p
              style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; text-align: center;"
            >"💡 Usa casos: Antes/después de ediciones, comparar versiones, mostrar transformaciones"</p>
          </Card>
        </div>

        <Card title="Comparación de Edición">
          <ImageComparison
            beforeImage="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1200"
            afterImage="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1200&blur=50"
            beforeLabel="Original"
            afterLabel="Con Blur"
          />
        </Card>

        <Card title="Comparación de Estilos">
          <ImageComparison
            beforeImage="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=1200"
            afterImage="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=1200&sepia=100"
            beforeLabel="Moderno"
            afterLabel="Vintage"
          />
        </Card>
      </div>

      /* Sección: Galería Clickeable */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🎨 Image Gallery con Lightbox"</h4>

      <p
        style="text-align: center; margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
          currentTheme)};"
      >"Haz clic en cualquier imagen para verla en pantalla completa con controles de zoom y rotación"</p>

      <div::demoGrid>
        {
          Array.mapWithIndex(getSampleImages(),
            (image : String, index : Number) {
              let alt =
                Array.at(getSampleAlts(), index)
                |> Maybe.withDefault("Gallery image")

              <Card title="Imagen #{Number.toString(index + 1)}">
                <div
                  style="cursor: pointer; transition: transform 0.2s ease;"
                  onClick={(event : Html.Event) { handleImageClick(image, event) }}
                >
                  <Image src={image} alt={alt} width="100%" height="250px"/>
                </div>

                <p
                  style="margin-top: 0.75rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
                    currentTheme)}; text-align: center;"
                >{alt}</p>

                <Flex justify="center" gap="0.5rem">
                  <Badge variant="primary">"Clic para ampliar"</Badge>
                </Flex>
              </Card>
            })
        }
      </div>

      /* Sección: Componentes Básicos */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"👤 Basic Media Components"</h4>

      <div::demoGrid>
        <Card title="Avatars">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Avatares en diferentes tamaños para perfiles de usuario"</p>

          <Flex justify="center" align="center" gap="1.5rem">
            <div style="text-align: center;">
              <Avatar size="sm" initials="JS"/>
              <p
                style="margin-top: 0.5rem; font-size: 0.75rem; color: #{ThemeHelpers.getTextSecondary(
                  currentTheme)};"
              >"Small"</p>
            </div>

            <div style="text-align: center;">
              <Avatar size="md" initials="PD"/>
              <p
                style="margin-top: 0.5rem; font-size: 0.75rem; color: #{ThemeHelpers.getTextSecondary(
                  currentTheme)};"
              >"Medium"</p>
            </div>

            <div style="text-align: center;">
              <Avatar size="lg" initials="MT"/>
              <p
                style="margin-top: 0.5rem; font-size: 0.75rem; color: #{ThemeHelpers.getTextSecondary(
                  currentTheme)};"
              >"Large"</p>
            </div>

            <div style="text-align: center;">
              <Avatar size="xl" initials="XL"/>
              <p
                style="margin-top: 0.5rem; font-size: 0.75rem; color: #{ThemeHelpers.getTextSecondary(
                  currentTheme)};"
              >"X-Large"</p>
            </div>
          </Flex>
        </Card>

        <Card title="Avatar con Imagen">
          <Flex justify="center" align="center" gap="1.5rem">
            <Avatar
              src="https://i.pravatar.cc/150?img=1"
              alt="User 1"
              size="md"
              shape="circle"
            />
            <Avatar
              src="https://i.pravatar.cc/150?img=2"
              alt="User 2"
              size="md"
              shape="square"
            />
            <Avatar
              src="https://i.pravatar.cc/150?img=3"
              alt="User 3"
              size="md"
              shape="rounded"
            />
          </Flex>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"Formas: circle • square • rounded"</p>
        </Card>

        <Card title="Image Gallery (Built-in)">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Galería simple con thumbnails y vista principal"</p>

          <ImageGallery
            images={[
              "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800",
              "https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800",
              "https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=800"
            ]}
            alts={["Montañas", "Bosque", "Naturaleza"]}
          />
        </Card>

        <Card title="Icons">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Iconos en diferentes tamaños y colores"</p>

          <Flex justify="center" align="center" gap="1.5rem">
            <Icon name="heart" size="lg" color="#ef4444"/>
            <Icon name="star" size="lg" color="#fbbf24"/>
            <Icon name="user" size="lg" color="#667eea"/>
            <Icon name="home" size="lg" color="#10b981"/>
            <Icon name="check" size="lg" color="#06b6d4"/>
          </Flex>

          <Flex justify="center" align="center" gap="1rem">
            <Icon name="heart" size="sm"/>
            <Icon name="star" size="md"/>
            <Icon name="user" size="lg"/>
            <Icon name="home" size="xl"/>
          </Flex>
        </Card>

        <Card title="Enhanced Image with Loading">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Imagen con estados de carga y error automáticos"</p>

          <Image
            src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600"
            alt="Enhanced image"
            width="100%"
            height="200px"
            loading="lazy"
          />
        </Card>

      </div>

      /* Sección: Reproductores de Video */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🎬 Video Players"</h4>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="Custom Video Player - Full Controls">
            <p
              style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >"Reproductor de video 100% custom con controles completos, speed control, fullscreen y más"</p>

            <CustomVideoPlayer
              src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
              poster="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=1200"
              width="100%"
              height="500px"
              autoplay={false}
              loop={false}
            />

            <Flex justify="center" gap="1rem">
              <Badge variant="primary">"Play/Pause"</Badge>
              <Badge variant="success">"Volume Control"</Badge>
              <Badge variant="info">"Speed Control"</Badge>
              <Badge>"Fullscreen"</Badge>
              <Badge>"Progress Bar"</Badge>
            </Flex>
          </Card>
        </div>

        <Card title="Mini Player - Compacto (16:9)">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Versión compacta horizontal para previews"</p>

          <MiniVideoPlayer
            src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
            poster="https://images.unsplash.com/photo-1485846234645-a62644f84728?w=600"
            width="100%"
            height="200px"
          />
        </Card>

        <Card title="Mini Player - Cuadrado (1:1)">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Formato cuadrado para redes sociales"</p>

          <MiniVideoPlayer
            src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
            poster="https://images.unsplash.com/photo-1574267432553-4b4628081c31?w=600"
            width="100%"
            height="350px"
          />
        </Card>

        <Card title="Mini Player - Vertical (9:16)">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Formato vertical para stories/reels"</p>

          <MiniVideoPlayer
            src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
            poster="https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=600"
            width="100%"
            height="500px"
          />
        </Card>
      </div>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="Video Grid">
            <p
              style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >"Grid de videos con mini reproductores"</p>

            <VideoGrid
              videos={[
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
              ]}
              posters={[
                "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=600",
                "https://images.unsplash.com/photo-1485846234645-a62644f84728?w=600",
                "https://images.unsplash.com/photo-1574267432553-4b4628081c31?w=600",
                "https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=600",
                "https://images.unsplash.com/photo-1492691527719-9d1e07e534b4?w=600",
                "https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=600"
              ]}
              columns={3}
            />
          </Card>
        </div>
      </div>

      /* Sección: Grids y Layouts */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🎨 Grids y Layouts"</h4>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="Image Grid Responsive">
            <p
              style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >"Grid responsive que se adapta a diferentes tamaños de pantalla"</p>

            <ImageGrid
              images={getSampleImages()}
              columns={4}
              aspectRatio="1/1"
              gap="1rem"
            />
          </Card>
        </div>

        <div::fullWidthCard>
          <Card title="Masonry Layout (Pinterest Style)">
            <p
              style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >"Layout estilo Pinterest con columnas adaptativas"</p>

            <ImageMasonry
              images={[
                "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=600",
                "https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400&h=400",
                "https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=400&h=700",
                "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=400&h=500",
                "https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=400&h=600"
              ]}
              columns={3}
              gap="1rem"
            />
          </Card>
        </div>
      </div>

      /* Sección: Efectos de Hover */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🎭 Efectos de Hover"</h4>

      <div::demoGrid>
        <Card title="Hover Zoom">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Zoom automático al pasar el mouse por encima"</p>

          <ImageHoverZoom
            src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600"
            alt="Hover zoom"
            height="250px"
          />
        </Card>

        <Card title="Image Overlay">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Overlay con información que aparece al hover"</p>

          <ImageOverlay
            src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=600"
            title="Bosque Místico"
            description="Un hermoso paisaje de bosque cubierto por la niebla matinal"
            height="250px"
          />
        </Card>

        <Card title="Parallax Effect">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Efecto parallax con movimiento suave"</p>

          <ImageParallax
            src="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=800"
            alt="Parallax"
            height="300px"
            speed={0.5}
          />

          <p
            style="margin-top: 0.75rem; font-size: 0.75rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"⚠️ El efecto se activa con el scroll"</p>
        </Card>
      </div>

      /* Sección: Filtros CSS */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🌈 Filtros de Imagen"</h4>

      <div::demoGrid>
        <Card title="Grayscale">
          <ImageFilter
            src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600"
            alt="Grayscale"
            filter="grayscale"
            height="200px"
          />
        </Card>

        <Card title="Sepia">
          <ImageFilter
            src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=600"
            alt="Sepia"
            filter="sepia"
            height="200px"
          />
        </Card>

        <Card title="Vintage">
          <ImageFilter
            src="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=600"
            alt="Vintage"
            filter="vintage"
            height="200px"
          />
        </Card>

        <Card title="Brightness">
          <ImageFilter
            src="https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=600"
            alt="Brightness"
            filter="brightness"
            height="200px"
          />
        </Card>

        <Card title="Contrast">
          <ImageFilter
            src="https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=600"
            alt="Contrast"
            filter="contrast"
            height="200px"
          />
        </Card>

        <Card title="Saturate">
          <ImageFilter
            src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600"
            alt="Saturate"
            filter="saturate"
            height="200px"
          />
        </Card>

        <Card title="Hue Rotate">
          <ImageFilter
            src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=600"
            alt="Hue Rotate"
            filter="hue-rotate"
            height="200px"
          />
        </Card>

        <Card title="Invert">
          <ImageFilter
            src="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=600"
            alt="Invert"
            filter="invert"
            height="200px"
          />
        </Card>
      </div>

      /* Sección: Lazy Loading */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"⚡ Optimización"</h4>

      <div::demoGrid>
        <Card title="Lazy Load con Placeholder">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Carga progresiva con placeholder borroso"</p>

          <ImageLazyLoad
            src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800"
            placeholder="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=50"
            alt="Lazy load"
            height="250px"
          />
        </Card>

        <Card title="Lazy Load con Loader">
          <p
            style="margin-bottom: 1rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; font-size: 0.875rem;"
          >"Carga con spinner animado"</p>

          <ImageLazyLoad
            src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800"
            placeholder=""
            alt="Lazy load"
            height="250px"
          />
        </Card>
      </div>

      /* Sección: Características */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"✨ Características Destacadas"</h4>

      <div::demoGrid>
        <Card title="🎯 ImageCarousel">
          <ul
            style="color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; line-height: 1.8; padding-left: 1.5rem;"
          >
            <li>"✓ Navegación prev/next con botones"</li>
            <li>"✓ Thumbnails clickeables"</li>
            <li>"✓ Indicadores de posición"</li>
            <li>"✓ Autoplay configurable con pausa"</li>
            <li>"✓ Zoom integrado con clic"</li>
            <li>"✓ Animaciones suaves"</li>
            <li>"✓ Diseño responsive"</li>
          </ul>
        </Card>

        <Card title="🔍 ImageZoom">
          <ul
            style="color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; line-height: 1.8; padding-left: 1.5rem;"
          >
            <li>"✓ Zoom activado con clic"</li>
            <li>"✓ Seguimiento del mouse al explorar"</li>
            <li>"✓ Niveles de zoom configurables"</li>
            <li>"✓ Indicador visual del nivel"</li>
            <li>"✓ Transform origin dinámico"</li>
            <li>"✓ Cursor personalizado"</li>
          </ul>
        </Card>

        <Card title="🌟 ImageLightbox">
          <ul
            style="color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; line-height: 1.8; padding-left: 1.5rem;"
          >
            <li>"✓ Modal de pantalla completa"</li>
            <li>"✓ Controles de zoom +/-"</li>
            <li>"✓ Rotación de imagen 90°"</li>
            <li>"✓ Botón reset rápido"</li>
            <li>"✓ Cerrar con botón X"</li>
            <li>"✓ Glassmorphism design"</li>
            <li>"✓ Animaciones de entrada"</li>
          </ul>
        </Card>

        <Card title="⚖️ ImageComparison">
          <ul
            style="color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; line-height: 1.8; padding-left: 1.5rem;"
          >
            <li>"✓ Slider interactivo"</li>
            <li>"✓ Comparación lado a lado"</li>
            <li>"✓ Etiquetas personalizables"</li>
            <li>"✓ Handle visual elegante"</li>
            <li>"✓ Cursor ew-resize"</li>
            <li>"✓ Perfecto para antes/después"</li>
          </ul>
        </Card>
      </div>

      /* Sección: Advanced Lightbox */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🎨 Advanced Lightbox"</h4>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="Advanced Lightbox - Navegación + Swipe + Keyboard">
            <p
              style="margin-bottom: 1.5rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)};"
            >"Lightbox profesional con todas las funciones: navegación, swipe móvil, atajos de teclado (← → Esc), zoom, rotar y descargar."</p>

            <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 1rem;">
              {
                Array.mapWithIndex(getSampleImages(),
                  (image : String, index : Number) {
                    <div
                      style="cursor: pointer; border-radius: 8px; overflow: hidden; aspect-ratio: 1;"
                      onClick={(event : Html.Event) { openAdvancedLightbox(index, event) }}
                    >
                      <img
                        src={image}
                        alt="Click para abrir lightbox"
                        style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;"
                      />
                    </div>
                  })
              }
            </div>

            <ul
              style="margin-top: 1.5rem; line-height: 1.8; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >
              <li>"✓ Navegación anterior/siguiente (← →)"</li>
              <li>"✓ Swipe en dispositivos táctiles"</li>
              <li>"✓ Atajos de teclado (ESC para cerrar)"</li>
              <li>"✓ Contador de imágenes (3 / 5)"</li>
              <li>"✓ Zoom, rotar, reset y descargar"</li>
              <li>"✓ Animaciones suaves y profesionales"</li>
            </ul>
          </Card>
        </div>
      </div>

      /* Sección: Lazy Loading con LQIP */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"⚡ Lazy Loading + Blur Placeholder"</h4>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="LazyImage - LQIP (Low Quality Image Placeholder)">
            <p
              style="margin-bottom: 1.5rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)};"
            >"Imágenes con lazy loading inteligente, Intersection Observer, placeholder blur y animaciones suaves. Perfecto para mejorar el rendimiento."</p>

            <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; margin-bottom: 1.5rem;">
              <LazyImage
                src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800"
                placeholder="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=20"
                alt="Montañas con placeholder blur"
                height="300px"
                objectFit="cover"
              />

              <LazyImage
                src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800"
                placeholder="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=20"
                alt="Bosque con placeholder blur"
                height="300px"
                objectFit="cover"
              />

              <LazyImage
                src="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=800"
                placeholder="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=20"
                alt="Naturaleza con placeholder blur"
                height="300px"
                objectFit="cover"
              />
            </div>

            <ul
              style="line-height: 1.8; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >
              <li>"✓ Intersection Observer (carga solo cuando visible)"</li>
              <li>"✓ Placeholder blur (LQIP) con imagen baja resolución"</li>
              <li>"✓ Skeleton loader animado si no hay placeholder"</li>
              <li>"✓ Transiciones suaves (fade + scale)"</li>
              <li>"✓ Manejo de errores con UI amigable"</li>
              <li>"✓ Soporte nativo loading='lazy'"</li>
              <li>"✓ Mejora significativa en rendimiento"</li>
            </ul>
          </Card>
        </div>
      </div>

      /* Sección: LazyImage + AdvancedLightbox Integration */
      <h4::subsectionTitle style={getSubsectionTitleStyles()}>"🔗 Integración: Lazy + Lightbox"</h4>

      <div::demoGrid>
        <div::fullWidthCard>
          <Card title="LazyImage + Advanced Lightbox - Experiencia Completa">
            <p
              style="margin-bottom: 1.5rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)};"
            >"Combinación perfecta: imágenes con lazy loading y placeholder blur que abren en lightbox avanzado al hacer click."</p>

            <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 1rem;">
              {
                Array.mapWithIndex(getSampleImages(),
                  (image : String, index : Number) {
                    let placeholderUrl =
                      String.replace(image, "?w=800", "?w=20")

                    <LazyImage
                      src={image}
                      placeholder={placeholderUrl}
                      alt="Click para ver en lightbox"
                      height="200px"
                      objectFit="cover"
                      onClick={(event : Html.Event) { openAdvancedLightbox(index, event) }}
                    />
                  })
              }
            </div>

            <p
              style="margin-top: 1.5rem; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem; font-style: italic;"
            >"💡 Tip: Haz scroll hacia abajo para ver el lazy loading en acción. Las imágenes se cargan solo cuando están visibles."</p>

            <ul
              style="margin-top: 1rem; line-height: 1.8; color: #{ThemeHelpers.getTextSecondary(
                currentTheme)}; font-size: 0.875rem;"
            >
              <li>"✓ Carga progresiva con blur placeholder"</li>
              <li>"✓ Click para abrir en lightbox completo"</li>
              <li>"✓ Navegación fluida entre imágenes"</li>
              <li>"✓ Optimización máxima de rendimiento"</li>
              <li>"✓ UX profesional de principio a fin"</li>
            </ul>
          </Card>
        </div>
      </div>

      /* Lightbox Components - Siempre renderizados pero ocultos */
      <ImageLightbox
        src={selectedImage}
        alt="Imagen ampliada"
        isOpen={lightboxOpen}
        onClose={closeLightbox}
      />

      <AdvancedLightbox
        images={getSampleImages()}
        alts={getSampleAlts()}
        startIndex={advancedLightboxIndex}
        isOpen={advancedLightboxOpen}
        onClose={closeAdvancedLightbox}
        enableKeyboard={true}
        enableSwipe={true}
        showCounter={true}
      />
    </div>
  }
}
