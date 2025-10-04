/* MediaDocsPage - Documentación de componentes de Media */
component MediaDocsPage {
  connect ThemeStore exposing { currentTheme }

  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style pageDescription {
    font-size: 1.125rem;
    opacity: 0.8;
    margin-bottom: 3rem;
    line-height: 1.6;
  }

  style section {
    margin-bottom: 4rem;
  }

  style sectionTitle {
    font-size: 1.75rem;
    font-weight: 700;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid;
  }

  fun getSectionTitleStyles : String {
    "border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style componentCard {
    padding: 1.5rem;
    border-radius: 12px;
    margin-bottom: 2rem;
    border: 1px solid;
  }

  fun getComponentCardStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style componentName {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
  }

  style componentDescription {
    opacity: 0.8;
    margin-bottom: 1.5rem;
    line-height: 1.6;
  }

  style exampleContainer {
    padding: 2rem;
    border-radius: 8px;
    margin: 1.5rem 0;
  }

  fun getExampleContainerStyles : String {
    "background: #{ThemeHelpers.getBackground(currentTheme)};"
  }

  style codeBlock {
    padding: 1rem;
    border-radius: 8px;
    margin-top: 1rem;
    overflow-x: auto;
    font-family: 'Fira Code', monospace;
    font-size: 0.875rem;
    line-height: 1.6;
  }

  fun getCodeBlockStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style badge {
    display: inline-block;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: 600;
    margin-left: 0.5rem;
  }

  fun getBadgeStyles (variant : String) : String {
    case variant {
      "new" => "background: #10b981; color: white;"
      "media" => "background: #8b5cf6; color: white;"
      => "background: #{ThemeHelpers.getAccent(currentTheme)}; color: white;"
    }
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Media Components"</h1>

      <p::pageDescription>
        "Advanced media components for images, videos, and galleries.
        Includes lazy loading, lightbox, carousels, and custom video player."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Image Carousel"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "ImageCarousel"
            <span::badge style={getBadgeStyles("media")}>"Media"</span>
          </h3>

          <p::componentDescription>
            "Full-featured carousel with navigation, indicators, autoplay, and zoom."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ImageCarousel
              images={[
                "https://picsum.photos/800/400?random=1",
                "https://picsum.photos/800/400?random=2",
                "https://picsum.photos/800/400?random=3"
              ]}
              autoPlay={true}
              interval={3000}
              showThumbnails={true}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ImageCarousel
  images={[
    \"https://picsum.photos/800/400?random=1\",
    \"https://picsum.photos/800/400?random=2\"
  ]}
  autoPlay={true}
  interval={3000}
  showThumbnails={true}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Advanced Lightbox"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "AdvancedLightbox"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Professional lightbox with keyboard shortcuts, swipe gestures, zoom, rotate,
            and download. Perfect for image galleries."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <p>"Advanced lightbox with keyboard shortcuts, swipe gestures, and zoom controls."</p>
          </div>

          <CodeHighlight
            language="mint"
            code="<AdvancedLightbox
  images={[\"img1.jpg\", \"img2.jpg\"]}
  alts={[\"Image 1\", \"Image 2\"]}
  startIndex={0}
  isOpen={lightboxOpen}
  onClose={closeLightbox}
  enableKeyboard={true}
  enableSwipe={true}
  showCounter={true}
/>

// Features:
// - ← → Arrow keys for navigation
// - Esc to close
// - Swipe gestures on mobile
// - Zoom in/out controls
// - Rotate image
// - Download current image
// - Image counter (1/10)"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Lazy Image (LQIP)"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "LazyImage"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Lazy-loaded images with LQIP (Low Quality Image Placeholder) for better
            performance and user experience."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Grid columns={2} gap="1rem">
              <LazyImage
                src="https://picsum.photos/600/400?random=7"
                placeholder="https://picsum.photos/60/40?random=7"
                alt="Lazy loaded image"
                height="300px"
              />

              <LazyImage
                src="https://picsum.photos/600/400?random=8"
                placeholder="https://picsum.photos/60/40?random=8"
                alt="Lazy loaded image"
                height="300px"
              />
            </Grid>
          </div>

          <CodeHighlight
            language="mint"
            code="<LazyImage
  src=\"high-res-image.jpg\"
  placeholder=\"low-res-placeholder.jpg\"
  alt=\"Description\"
  height=\"300px\"
  objectFit=\"cover\"
/>

// Features:
// - Blurred placeholder (20px blur)
// - Smooth fade transition
// - IntersectionObserver lazy loading
// - Skeleton loader during load
// - Error handling"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Video Player"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "VideoPlayer"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Custom video player with full controls, playback speed, picture-in-picture,
            fullscreen, and download with progress tracking."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <CustomVideoPlayer
              src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
              poster="https://picsum.photos/800/450?random=9"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<CustomVideoPlayer
  src=\"video.mp4\"
  poster=\"poster.jpg\"
/>

// Features:
// - Play/Pause (click anywhere on video)
// - Timeline scrubbing with preview
// - Volume control with mute
// - Playback speed (0.5x, 1x, 1.5x, 2x, 3x)
// - Picture-in-Picture mode
// - Fullscreen support
// - Download with progress bar
// - Buffering indicator
// - Keyboard shortcuts
// - Responsive controls"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Mini Video Player"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "MiniVideoPlayer"
            <span::badge style={getBadgeStyles("media")}>"Media"</span>
          </h3>

          <p::componentDescription>
            "Compact video player for previews and inline videos. Click to play/pause."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Grid columns={3} gap="1rem">
              <MiniVideoPlayer
                src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
                poster="https://picsum.photos/300/200?random=10"
                height="200px"
              />

              <MiniVideoPlayer
                src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
                poster="https://picsum.photos/300/300?random=11"
                height="350px"
              />

              <MiniVideoPlayer
                src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
                poster="https://picsum.photos/300/500?random=12"
                height="500px"
              />
            </Grid>
          </div>

          <CodeHighlight
            language="mint"
            code="<MiniVideoPlayer
  src=\"video.mp4\"
  poster=\"poster.jpg\"
  height=\"200px\"
  aspectRatio=\"16:9\"
/>

// Features:
// - Click to play/pause
// - Play button overlay
// - Automatic aspect ratio
// - Responsive sizing"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Image Masonry"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "ImageMasonry"
            <span::badge style={getBadgeStyles("media")}>"Media"</span>
          </h3>

          <p::componentDescription>
            "Pinterest-style masonry grid for images of varying heights."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ImageMasonry
              images={[
                "https://picsum.photos/300/400?random=13",
                "https://picsum.photos/300/300?random=14",
                "https://picsum.photos/300/500?random=15",
                "https://picsum.photos/300/350?random=16",
                "https://picsum.photos/300/450?random=17",
                "https://picsum.photos/300/320?random=18"
              ]}
              columns={3}
              gap="1rem"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ImageMasonry
  images={[\"img1.jpg\", \"img2.jpg\"]}
  columns={3}
  gap=\"1rem\"
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Image Comparison"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "ImageComparison"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Before/after image comparison with draggable slider."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ImageComparison
              beforeImage="https://picsum.photos/800/600?random=19"
              afterImage="https://picsum.photos/800/600?random=20"
              beforeLabel="Before"
              afterLabel="After"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ImageComparison
  beforeImage=\"before.jpg\"
  afterImage=\"after.jpg\"
  beforeLabel=\"Before\"
  afterLabel=\"After\"
/>

// Features:
// - Draggable slider
// - Labels on corners
// - Smooth transitions
// - Mouse tracking"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Image Zoom"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "ImageZoom"
            <span::badge style={getBadgeStyles("media")}>"Media"</span>
          </h3>

          <p::componentDescription>
            "Interactive image with zoom on click and mouse tracking."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ImageZoom
              src="https://picsum.photos/800/600?random=21"
              alt="Zoomable image"
              width="100%"
              height="400px"
              zoomLevel={2}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ImageZoom
  src=\"image.jpg\"
  alt=\"Description\"
  width=\"100%\"
  height=\"400px\"
  zoomLevel={2}
/>

// Features:
// - Click to toggle zoom
// - Mouse tracking for zoom position
// - Smooth transitions
// - Customizable zoom level"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Barcode & QR Codes"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "QRCode & Barcode"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Generate QR codes and barcodes in multiple formats with extensive customization options."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <BarcodeDemo/>
          </div>

          <CodeHighlight
            language="mint"
            code="// QR Code
<QRCode
  data=\"https://mint-lang.com\"
  size={200}
  foregroundColor=\"#667eea\"
  showLabel={true}
  label=\"Scan me!\"
/>

// Barcode
<Barcode
  data=\"1234567890\"
  format=\"CODE128\"
  width={2}
  height={80}
  displayValue={true}
/>

// Supported Barcode Formats:
// - CODE128, CODE39
// - EAN13, EAN8
// - UPC, ITF14
// - MSI, Pharmacode, Codabar"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Avatars"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Avatar & AvatarGroup"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Flexible avatar components with images, initials, status indicators, sizes, shapes, and groups."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <AvatarDemo/>
          </div>

          <CodeHighlight
            language="mint"
            code="// Simple avatar with image
<Avatar
  src=\\\"https://i.pravatar.cc/150?img=1\\\"
  size=\\\"lg\\\"
  shape=\\\"circle\\\"
/>

// Avatar with initials
<Avatar
  initials=\\\"JD\\\"
  size=\\\"xl\\\"
  bgColor=\\\"#667eea\\\"
/>

// Avatar with status
<Avatar
  src=\\\"https://i.pravatar.cc/150?img=2\\\"
  size=\\\"lg\\\"
  showStatus={true}
  status=\\\"online\\\"
  bordered={true}
/>

// Avatar group
<AvatarGroup
  avatars={[\\\"url1.jpg\\\", \\\"url2.jpg\\\", \\\"url3.jpg\\\"]}
  size=\\\"md\\\"
  max={5}
/>

// Properties:
// - size: xs, sm, md, lg, xl, 2xl
// - shape: circle, rounded, square
// - status: online, offline, away, busy
// - spacing: tight, normal, loose"
          />
        </div>
      </div>
    </div>
  }
}
