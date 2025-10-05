/* EnterExit - Reusable animation component */

component EnterExit {
  /* Props */
  property animation : String = "fadeIn"
  property duration : Number = 0.6
  property easing : String = "ease-out"
  property delay : Number = 0
  property content : Html = Html.empty()

  /* Keyframes Animations */
  style fadeIn {
    @keyframes fadeIn {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }
  }

  style fadeInUp {
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  style fadeInDown {
    @keyframes fadeInDown {
      from {
        opacity: 0;
        transform: translateY(-30px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  style slideInRight {
    @keyframes slideInRight {
      from {
        opacity: 0;
        transform: translateX(30px);
      }

      to {
        opacity: 1;
        transform: translateX(0);
      }
    }
  }

  style slideInLeft {
    @keyframes slideInLeft {
      from {
        opacity: 0;
        transform: translateX(-30px);
      }

      to {
        opacity: 1;
        transform: translateX(0);
      }
    }
  }

  style scaleIn {
    @keyframes scaleIn {
      from {
        opacity: 0;
        transform: scale(0.9);
      }

      to {
        opacity: 1;
        transform: scale(1);
      }
    }
  }

  style zoomIn {
    @keyframes zoomIn {
      from {
        opacity: 0;
        transform: scale(0);
      }

      to {
        opacity: 1;
        transform: scale(1);
      }
    }
  }

  style rotateIn {
    @keyframes rotateIn {
      from {
        opacity: 0;
        transform: rotate(-180deg);
      }

      to {
        opacity: 1;
        transform: rotate(0);
      }
    }
  }

  /* Wrapper style */
  style wrapper {
    animation-name: #{animation};
    animation-duration: #{Number.toString(duration)}s;
    animation-timing-function: #{easing};
    animation-delay: #{Number.toString(delay)}s;
    animation-fill-mode: both;
  }

  /* Render */
  fun render : Html {
    <>
      /* Hidden elements to ensure keyframes are included */
      <div::fadeIn style="display:none;"/>
      <div::fadeInUp style="display:none;"/>
      <div::fadeInDown style="display:none;"/>
      <div::slideInRight style="display:none;"/>
      <div::slideInLeft style="display:none;"/>
      <div::scaleIn style="display:none;"/>
      <div::zoomIn style="display:none;"/>
      <div::rotateIn style="display:none;"/>

      <div::wrapper>
        {content}
      </div>
    </>
  }
}
