component IntroductionPage {
  connect ViewModeStore exposing { viewMode }

  state mouseX : Number = 0
  state mouseY : Number = 0
  state scrollY : Number = 0
  state isVisible : Bool = false

  fun componentDidMount : Promise(Void) {
    `
    (() => {
      // Mouse tracking for interactive effects
      window.addEventListener('mousemove', (e) => {
        #{next {
          mouseX: `e.clientX`,
          mouseY: `e.clientY`
        }}
      });

      // Scroll tracking
      window.addEventListener('scroll', () => {
        #{next { scrollY: `window.scrollY` }}
      });

      // Intersection Observer for scroll animations
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('animate-in');
          }
        });
      }, { threshold: 0.1 });

      document.querySelectorAll('.animate-on-scroll').forEach(el => {
        observer.observe(el);
      });

      // Magnetic button effect
      document.querySelectorAll('.magnetic-btn').forEach(btn => {
        btn.addEventListener('mousemove', (e) => {
          const rect = btn.getBoundingClientRect();
          const x = e.clientX - rect.left - rect.width / 2;
          const y = e.clientY - rect.top - rect.height / 2;

          btn.style.transform = \`translate(\${x * 0.3}px, \${y * 0.3}px)\`;
        });

        btn.addEventListener('mouseleave', () => {
          btn.style.transform = 'translate(0, 0)';
        });
      });

      // Parallax layers
      window.addEventListener('scroll', () => {
        const scrolled = window.scrollY;
        document.querySelectorAll('.parallax-layer').forEach((layer, index) => {
          const speed = (index + 1) * 0.1;
          layer.style.transform = \`translateY(\${scrolled * speed}px)\`;
        });
      });

      // Cursor trail effect
      const canvas = document.getElementById('cursor-trail');
      const ctx = canvas.getContext('2d');
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;

      const particles = [];
      const particleCount = 50;

      window.addEventListener('mousemove', (e) => {
        particles.push({
          x: e.clientX,
          y: e.clientY,
          size: Math.random() * 5 + 2,
          speedX: (Math.random() - 0.5) * 2,
          speedY: (Math.random() - 0.5) * 2,
          life: 1
        });

        if (particles.length > particleCount) {
          particles.shift();
        }
      });

      function animateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        particles.forEach((particle, index) => {
          particle.x += particle.speedX;
          particle.y += particle.speedY;
          particle.life -= 0.02;
          particle.size *= 0.95;

          if (particle.life <= 0) {
            particles.splice(index, 1);
            return;
          }

          const gradient = ctx.createRadialGradient(
            particle.x, particle.y, 0,
            particle.x, particle.y, particle.size
          );
          gradient.addColorStop(0, \`rgba(25, 137, 250, \${particle.life})\`);
          gradient.addColorStop(1, \`rgba(25, 137, 250, 0)\`);

          ctx.fillStyle = gradient;
          ctx.beginPath();
          ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
          ctx.fill();
        });

        requestAnimationFrame(animateParticles);
      }

      animateParticles();

      window.addEventListener('resize', () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
      });
    })()
    `

    Promise.never()
  }

  style container {
    width: 100%;
    overflow-x: hidden;
    position: relative;
    background: #0a0a0f;
  }

  style cursorTrail {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    z-index: 9999;
  }

  style hero {
    position: relative;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    background: linear-gradient(180deg, #0a0a0f 0%, #1a1a2e 100%);
  }

  style heroBackground {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }

  style gradientOrb {
    position: absolute;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.6;
    animation: float 20s ease-in-out infinite;
  }

  style orb1 {
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, #1989fa 0%, transparent 70%);
    top: -200px;
    left: -200px;
    animation-delay: 0s;
  }

  style orb2 {
    width: 500px;
    height: 500px;
    background: radial-gradient(circle, #07c160 0%, transparent 70%);
    bottom: -150px;
    right: -150px;
    animation-delay: -5s;
  }

  style orb3 {
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, #667eea 0%, transparent 70%);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation-delay: -10s;
  }

  style gridPattern {
    position: absolute;
    width: 100%;
    height: 100%;

    background-image: linear-gradient(rgba(25, 137, 250, 0.1) 1px, transparent 1px),
                      linear-gradient(90deg, rgba(25, 137, 250, 0.1) 1px, transparent 1px);

    background-size: 50px 50px;
    opacity: 0.3;
    transform: perspective(500px) rotateX(60deg) scale(2);
    transform-origin: center center;
  }

  style heroContent {
    position: relative;
    z-index: 10;
    text-align: center;
    max-width: 1200px;
    padding: 60px 40px;
  }

  style badge {
    display: inline-block;
    padding: 12px 32px;
    background: rgba(25, 137, 250, 0.1);
    border: 2px solid rgba(25, 137, 250, 0.3);
    border-radius: 50px;
    color: #1989fa;
    font-size: 14px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 3px;
    margin-bottom: 32px;
    backdrop-filter: blur(10px);
    animation: pulse 3s ease-in-out infinite;
  }

  style mainTitle {
    font-size: 120px;
    font-weight: 900;
    margin: 0 0 32px;
    background: linear-gradient(135deg, #ffffff 0%, #1989fa 50%, #07c160 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    line-height: 1;
    letter-spacing: -5px;
    animation: fadeInUp 1s ease-out;
    text-shadow: 0 20px 60px rgba(25, 137, 250, 0.5);

    if viewMode == "mobile" {
      font-size: 56px;
      letter-spacing: -2px;
    }
  }

  style subtitle {
    font-size: 32px;
    color: rgba(255, 255, 255, 0.8);
    line-height: 48px;
    margin: 0 0 64px;
    font-weight: 300;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
    animation: fadeInUp 1s ease-out 0.2s both;

    if viewMode == "mobile" {
      font-size: 20px;
      line-height: 32px;
    }
  }

  style ctaGroup {
    display: flex;
    gap: 24px;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    animation: fadeInUp 1s ease-out 0.4s both;
  }

  style magneticBtn {
    padding: 24px 64px;
    font-size: 18px;
    font-weight: 700;
    border-radius: 60px;
    border: none;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;

    &::before {
      content: "";
      position: absolute;
      top: 50%;
      left: 50%;
      width: 0;
      height: 0;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.3);
      transform: translate(-50%, -50%);
      transition: width 0.5s, height 0.5s;
    }

    &:hover::before {
      width: 500px;
      height: 500px;
    }

    if viewMode == "mobile" {
      padding: 18px 48px;
      font-size: 16px;
    }
  }

  style primaryBtn {
    background: linear-gradient(135deg, #1989fa 0%, #07c160 100%);
    color: white;
    box-shadow: 0 20px 60px rgba(25, 137, 250, 0.4);

    &:hover {
      box-shadow: 0 30px 80px rgba(25, 137, 250, 0.6);
    }
  }

  style secondaryBtn {
    background: rgba(255, 255, 255, 0.05);
    color: white;
    border: 2px solid rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);

    &:hover {
      background: rgba(255, 255, 255, 0.1);
      border-color: rgba(255, 255, 255, 0.4);
    }
  }

  style featuresSection {
    position: relative;
    padding: 200px 40px;
    background: linear-gradient(180deg, #1a1a2e 0%, #0a0a0f 100%);

    if viewMode == "mobile" {
      padding: 100px 20px;
    }
  }

  style sectionHeader {
    text-align: center;
    margin-bottom: 120px;
    position: relative;
  }

  style sectionTitle {
    font-size: 72px;
    font-weight: 900;
    color: white;
    margin: 0 0 24px;
    line-height: 1.1;

    if viewMode == "mobile" {
      font-size: 42px;
    }
  }

  style sectionDesc {
    font-size: 24px;
    color: rgba(255, 255, 255, 0.6);
    line-height: 40px;
    max-width: 700px;
    margin: 0 auto;

    if viewMode == "mobile" {
      font-size: 18px;
      line-height: 30px;
    }
  }

  style featuresGrid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 60px;
    max-width: 1600px;
    margin: 0 auto;

    if viewMode == "mobile" {
      grid-template-columns: 1fr;
      gap: 40px;
    }
  }

  style featureCard {
    padding: 64px 48px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 32px;
    backdrop-filter: blur(20px);
    transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;

    &::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(135deg, rgba(25, 137, 250, 0.1) 0%, transparent 100%);
      opacity: 0;
      transition: opacity 0.6s;
    }

    &:hover {
      transform: translateY(-20px);
      border-color: rgba(25, 137, 250, 0.5);
      box-shadow: 0 40px 100px rgba(25, 137, 250, 0.3);

      &::before {
        opacity: 1;
      }
    }
  }

  style featureIcon {
    font-size: 72px;
    margin-bottom: 32px;
    display: block;
    filter: drop-shadow(0 10px 30px rgba(25, 137, 250, 0.5));
  }

  style featureTitle {
    font-size: 32px;
    font-weight: 800;
    color: white;
    margin: 0 0 20px;
  }

  style featureDesc {
    font-size: 18px;
    color: rgba(255, 255, 255, 0.7);
    line-height: 32px;
    margin: 0;
  }

  style showcaseSection {
    padding: 200px 40px;
    background: #0a0a0f;
    position: relative;
    overflow: hidden;

    if viewMode == "mobile" {
      padding: 100px 20px;
    }
  }

  style showcaseGrid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 100px;
    max-width: 1600px;
    margin: 0 auto;
    align-items: center;

    if viewMode == "mobile" {
      grid-template-columns: 1fr;
      gap: 60px;
    }
  }

  style showcaseContent {
    position: relative;
    z-index: 1;
  }

  style showcaseTitle {
    font-size: 64px;
    font-weight: 900;
    color: white;
    margin: 0 0 32px;
    line-height: 1.1;

    if viewMode == "mobile" {
      font-size: 40px;
    }
  }

  style showcaseText {
    font-size: 20px;
    color: rgba(255, 255, 255, 0.7);
    line-height: 36px;
    margin: 0 0 48px;
  }

  style showcaseVisual {
    position: relative;
    aspect-ratio: 1;
    background: linear-gradient(135deg, rgba(25, 137, 250, 0.2) 0%, rgba(7, 193, 96, 0.2) 100%);
    border-radius: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    border: 1px solid rgba(255, 255, 255, 0.1);

    &::before {
      content: "";
      position: absolute;
      width: 200%;
      height: 200%;

      background: conic-gradient(
                  from 0deg,
                  transparent 0deg,
                  rgba(25, 137, 250, 0.3) 90deg,
                  transparent 180deg,
                  rgba(7, 193, 96, 0.3) 270deg,
                  transparent 360deg
                  );

      animation: spin 10s linear infinite;
    }
  }

  style statsBar {
    padding: 120px 40px;
    background: linear-gradient(135deg, #1989fa 0%, #07c160 100%);
    position: relative;
    overflow: hidden;

    &::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;

      background-image: repeating-linear-gradient(0deg, transparent, transparent 40px, rgba(255, 255, 255, 0.03) 40px, rgba(255, 255, 255, 0.03) 41px),
                        repeating-linear-gradient(90deg, transparent, transparent 40px, rgba(255, 255, 255, 0.03) 40px, rgba(255, 255, 255, 0.03) 41px);

      opacity: 0.5;
    }

    if viewMode == "mobile" {
      padding: 80px 20px;
    }
  }

  style statsGrid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 60px;
    max-width: 1600px;
    margin: 0 auto;
    position: relative;
    z-index: 1;

    if viewMode == "mobile" {
      grid-template-columns: repeat(2, 1fr);
      gap: 40px;
    }
  }

  style statCard {
    text-align: center;
  }

  style statNumber {
    font-size: 96px;
    font-weight: 900;
    color: white;
    margin: 0 0 16px;
    line-height: 1;
    text-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);

    if viewMode == "mobile" {
      font-size: 64px;
    }
  }

  style statLabel {
    font-size: 20px;
    color: rgba(255, 255, 255, 0.9);
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 3px;
  }

  style ctaSection {
    padding: 200px 40px;
    background: #0a0a0f;
    text-align: center;
    position: relative;

    if viewMode == "mobile" {
      padding: 100px 20px;
    }
  }

  style ctaTitle {
    font-size: 80px;
    font-weight: 900;
    background: linear-gradient(135deg, #ffffff 0%, #1989fa 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin: 0 0 32px;
    line-height: 1.1;

    if viewMode == "mobile" {
      font-size: 48px;
    }
  }

  style ctaSubtitle {
    font-size: 28px;
    color: rgba(255, 255, 255, 0.7);
    margin: 0 0 80px;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;

    if viewMode == "mobile" {
      font-size: 20px;
      margin-bottom: 60px;
    }
  }

  fun render : Html {
    <div::container>
      <canvas::cursorTrail id="cursor-trail"/>

      <section::hero>
        <div::heroBackground>
          <div::gradientOrb::orb1 class="parallax-layer"/>
          <div::gradientOrb::orb2 class="parallax-layer"/>
          <div::gradientOrb::orb3 class="parallax-layer"/>
          <div::gridPattern/>
        </div>

        <div::heroContent>
          <div::badge class="animate-on-scroll">"KINETIC UI"</div>

          <div class="animate-on-scroll">
            <Heading level="1" margin="0">"Mint Wū"</Heading>
          </div>

          <div class="animate-on-scroll">
            <Text size="lg" margin="0 0 40px">
              "Motion-first UI components that bring your interfaces to life. "
              "Built for Mint Lang with fluid animations and interactive experiences."
            </Text>
          </div>

          <div::ctaGroup>
            <button::magneticBtn::primaryBtn class="magnetic-btn">
              "Start Creating"
            </button>

            <button::magneticBtn::secondaryBtn class="magnetic-btn">
              "View Showcase"
            </button>
          </div>
        </div>
      </section>

      <div::featuresSection>
        <div::sectionHeader class="animate-on-scroll">
          <Heading level="2" margin="0 0 16px">"Built for Motion"</Heading>

          <Text size="base" margin="0 0 32px">
            "Every interaction designed to feel natural, responsive, and delightful"
          </Text>
        </div>

        <div::featuresGrid>
          <div::featureCard class="animate-on-scroll">
            <span::featureIcon>"⚡"</span>
            <Heading level="3" margin="0 0 8px">"Lightning Fast"</Heading>

            <Text size="sm" margin="0">
              "60fps animations powered by GPU acceleration. Smooth performance even on low-end devices."
            </Text>
          </div>

          <div::featureCard class="animate-on-scroll">
            <span::featureIcon>"🎨"</span>
            <Heading level="3" margin="0 0 8px">"Gesture Based"</Heading>

            <Text size="sm" margin="0">
              "Natural touch interactions with spring physics and momentum scrolling built-in."
            </Text>
          </div>

          <div::featureCard class="animate-on-scroll">
            <span::featureIcon>"🎯"</span>
            <Heading level="3" margin="0 0 8px">"Layout Aware"</Heading>

            <Text size="sm" margin="0">
              "Automatic layout animations when elements resize, reorder, or change position."
            </Text>
          </div>

          <div::featureCard class="animate-on-scroll">
            <span::featureIcon>"🔮"</span>
            <Heading level="3" margin="0 0 8px">"Scroll Magic"</Heading>

            <Text size="sm" margin="0">
              "Parallax, reveal, and scroll-driven animations with precise control and easing."
            </Text>
          </div>

          <div::featureCard class="animate-on-scroll">
            <span::featureIcon>"✨"</span>
            <Heading level="3" margin="0 0 8px">"Micro-interactions"</Heading>

            <Text size="sm" margin="0">
              "Delightful details like magnetic buttons, ripple effects, and hover transformations."
            </Text>
          </div>

          <div::featureCard class="animate-on-scroll">
            <span::featureIcon>"🚀"</span>
            <Heading level="3" margin="0 0 8px">"Page Transitions"</Heading>

            <Text size="sm" margin="0">
              "Seamless route transitions with shared element animations and custom easing."
            </Text>
          </div>
        </div>
      </div>

      <div::showcaseSection>
        <div::showcaseGrid>
          <div::showcaseContent class="animate-on-scroll">
            <Heading level="2" margin="0 0 20px">"Interactive By Default"</Heading>

            <Text size="base" margin="0">
              "Every component responds to your cursor, touch, and scroll. "
              "Built with spring physics for natural motion that feels alive."
            </Text>

            <button::magneticBtn::primaryBtn class="magnetic-btn">
              "Explore Components"
            </button>
          </div>

          <div::showcaseVisual class="animate-on-scroll">
            <div style="font-size: 120px;">"🎨"</div>
          </div>
        </div>
      </div>

      <div::statsBar>
        <div::statsGrid>
          <div::statCard class="animate-on-scroll">
            <div::statNumber>"50+"</div>
            <div::statLabel>"Components"</div>
          </div>

          <div::statCard class="animate-on-scroll">
            <div::statNumber>"60fps"</div>
            <div::statLabel>"Performance"</div>
          </div>

          <div::statCard class="animate-on-scroll">
            <div::statNumber>"100%"</div>
            <div::statLabel>"Animated"</div>
          </div>

          <div::statCard class="animate-on-scroll">
            <div::statNumber>"∞"</div>
            <div::statLabel>"Possibilities"</div>
          </div>
        </div>
      </div>

      <div::ctaSection>
        <div class="animate-on-scroll">
          <Heading level="2" margin="0 0 20px">"Ready to Create Magic?"</Heading>
        </div>

        <div class="animate-on-scroll">
          <Text size="lg" margin="0 0 32px">
            "Start building beautiful, animated interfaces today"
          </Text>
        </div>

        <div::ctaGroup>
          <button::magneticBtn::primaryBtn class="magnetic-btn">
            "Get Started Free"
          </button>

          <button::magneticBtn::secondaryBtn class="magnetic-btn">
            "Browse Documentation"
          </button>
        </div>
      </div>
    </div>
  }
}
