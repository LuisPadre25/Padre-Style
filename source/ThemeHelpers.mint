/* Theme Helper Functions - Direct theme-aware styling */
module ThemeHelpers {
  /* Get theme-aware colors based on current theme */
  fun getBackgroundPrimary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #1e1b4b 100%)"
    } else {
      "linear-gradient(135deg, #f8fafc 0%, #e2e8f0 50%, #f1f5f9 100%)"
    }
  }

  fun getElevated (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.9)"
    } else {
      "rgba(255, 255, 255, 0.95)"
    }
  }

  fun getSurface (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.7)"
    } else {
      "rgba(255, 255, 255, 0.8)"
    }
  }

  fun getTextPrimary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.95)"
    } else {
      "rgba(15, 23, 42, 0.95)"
    }
  }

  fun getTextSecondary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.8)"
    } else {
      "rgba(51, 65, 85, 0.8)"
    }
  }

  fun getTextInverse (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(0, 0, 0, 0.9)"
    } else {
      "rgba(255, 255, 255, 0.95)"
    }
  }

  fun getBorderPrimary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.2)"
    } else {
      "rgba(15, 23, 42, 0.15)"
    }
  }

  fun getBorderSecondary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.1)"
    } else {
      "rgba(51, 65, 85, 0.1)"
    }
  }

  fun getBorderAccent (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 0.5)"
    } else {
      "rgba(102, 126, 234, 0.3)"
    }
  }

  fun getAccent (currentTheme : String) : String {
    "linear-gradient(135deg, #667eea 0%, #764ba2 100%)"
  }

  fun getAccentHover (currentTheme : String) : String {
    "linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%)"
  }

  fun getSuccess (currentTheme : String) : String {
    "linear-gradient(135deg, #10b981 0%, #059669 100%)"
  }

  fun getWarning (currentTheme : String) : String {
    "linear-gradient(135deg, #f59e0b 0%, #d97706 100%)"
  }

  fun getError (currentTheme : String) : String {
    "linear-gradient(135deg, #ef4444 0%, #dc2626 100%)"
  }

  fun getInfo (currentTheme : String) : String {
    "linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)"
  }

  fun getGlassBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.6)"
    } else {
      "rgba(255, 255, 255, 0.6)"
    }
  }

  fun getGlassHover (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.8)"
    } else {
      "rgba(255, 255, 255, 0.8)"
    }
  }

  fun getShadowLight (currentTheme : String) : String {
    if currentTheme == "dark" {
      "0 2px 8px rgba(0, 0, 0, 0.1)"
    } else {
      "0 2px 8px rgba(15, 23, 42, 0.08)"
    }
  }

  fun getShadowMedium (currentTheme : String) : String {
    if currentTheme == "dark" {
      "0 8px 32px rgba(0, 0, 0, 0.15)"
    } else {
      "0 8px 32px rgba(15, 23, 42, 0.12)"
    }
  }

  fun getShadowHeavy (currentTheme : String) : String {
    if currentTheme == "dark" {
      "0 20px 50px rgba(0, 0, 0, 0.25)"
    } else {
      "0 20px 50px rgba(15, 23, 42, 0.15)"
    }
  }

  /* Input & Form Colors */
  fun getInputBackground (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.8)"
    } else {
      "rgba(255, 255, 255, 0.9)"
    }
  }

  fun getInputBorder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.15)"
    } else {
      "rgba(15, 23, 42, 0.2)"
    }
  }

  fun getInputBorderFocus (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 0.8)"
    } else {
      "rgba(102, 126, 234, 0.6)"
    }
  }

  fun getInputBorderError (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(239, 68, 68, 0.8)"
    } else {
      "rgba(239, 68, 68, 0.6)"
    }
  }

  fun getInputPlaceholder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.4)"
    } else {
      "rgba(15, 23, 42, 0.4)"
    }
  }

  fun getInputDisabled (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.5)"
    } else {
      "rgba(15, 23, 42, 0.05)"
    }
  }

  fun getInputText (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.95)"
    } else {
      "rgba(15, 23, 42, 0.9)"
    }
  }

  /* Interactive States */
  fun getHoverBackground (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(51, 65, 85, 0.6)"
    } else {
      "rgba(102, 126, 234, 0.08)"
    }
  }

  fun getHoverBorder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.3)"
    } else {
      "rgba(102, 126, 234, 0.3)"
    }
  }

  fun getActiveBackground (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(51, 65, 85, 0.8)"
    } else {
      "rgba(102, 126, 234, 0.12)"
    }
  }

  fun getActiveBorder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 0.8)"
    } else {
      "rgba(102, 126, 234, 0.5)"
    }
  }

  fun getSelectedBackground (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 0.2)"
    } else {
      "rgba(102, 126, 234, 0.15)"
    }
  }

  fun getSelectedBorder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 1)"
    } else {
      "rgba(102, 126, 234, 0.8)"
    }
  }

  fun getFocusRing (currentTheme : String) : String {
    if currentTheme == "dark" {
      "0 0 0 3px rgba(102, 126, 234, 0.4)"
    } else {
      "0 0 0 3px rgba(102, 126, 234, 0.3)"
    }
  }

  /* Navigation Colors */
  fun getNavBackground (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.85)"
    } else {
      "rgba(255, 255, 255, 0.85)"
    }
  }

  fun getNavText (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.8)"
    } else {
      "rgba(15, 23, 42, 0.8)"
    }
  }

  fun getNavActive (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 0.3)"
    } else {
      "rgba(102, 126, 234, 0.15)"
    }
  }

  fun getNavHover (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(51, 65, 85, 0.6)"
    } else {
      "rgba(102, 126, 234, 0.08)"
    }
  }

  fun getNavBorder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.1)"
    } else {
      "rgba(15, 23, 42, 0.1)"
    }
  }

  /* Data Display Colors */
  fun getTableHeader (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.9)"
    } else {
      "rgba(15, 23, 42, 0.05)"
    }
  }

  fun getTableRow (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.6)"
    } else {
      "rgba(255, 255, 255, 0.5)"
    }
  }

  fun getTableRowAlt (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(51, 65, 85, 0.5)"
    } else {
      "rgba(15, 23, 42, 0.02)"
    }
  }

  fun getTableHover (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 0.1)"
    } else {
      "rgba(102, 126, 234, 0.08)"
    }
  }

  fun getTableBorder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.1)"
    } else {
      "rgba(15, 23, 42, 0.08)"
    }
  }

  fun getCardBackground (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.85)"
    } else {
      "rgba(255, 255, 255, 0.9)"
    }
  }

  fun getCardBorder (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.15)"
    } else {
      "rgba(15, 23, 42, 0.1)"
    }
  }

  /* Feedback Colors */
  fun getAlertInfoBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(59, 130, 246, 0.15)"
    } else {
      "rgba(59, 130, 246, 0.1)"
    }
  }

  fun getAlertSuccessBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(16, 185, 129, 0.15)"
    } else {
      "rgba(16, 185, 129, 0.1)"
    }
  }

  fun getAlertWarningBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(245, 158, 11, 0.15)"
    } else {
      "rgba(245, 158, 11, 0.1)"
    }
  }

  fun getAlertErrorBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(239, 68, 68, 0.15)"
    } else {
      "rgba(239, 68, 68, 0.1)"
    }
  }

  fun getToastBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 27, 75, 0.95)"
    } else {
      "rgba(255, 255, 255, 0.95)"
    }
  }

  fun getModalOverlay (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(0, 0, 0, 0.8)"
    } else {
      "rgba(15, 23, 42, 0.6)"
    }
  }

  fun getTooltipBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 27, 75, 0.95)"
    } else {
      "rgba(15, 23, 42, 0.9)"
    }
  }

  fun getTooltipText (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.95)"
    } else {
      "rgba(255, 255, 255, 0.95)"
    }
  }

  /* Effect Properties */
  fun getTransitionSpeed (currentTheme : String) : String {
    "0.3s"
  }

  fun getTransitionSpeedSlow (currentTheme : String) : String {
    "0.5s"
  }

  fun getTransitionSpeedFast (currentTheme : String) : String {
    "0.15s"
  }

  fun getAnimationCurve (currentTheme : String) : String {
    "cubic-bezier(0.4, 0, 0.2, 1)"
  }

  fun getBorderRadius (currentTheme : String) : String {
    "8px"
  }

  fun getBorderRadiusSmall (currentTheme : String) : String {
    "4px"
  }

  fun getBorderRadiusMedium (currentTheme : String) : String {
    "12px"
  }

  fun getBorderRadiusLarge (currentTheme : String) : String {
    "16px"
  }

  fun getBorderRadiusXLarge (currentTheme : String) : String {
    "24px"
  }

  fun getBorderRadiusFull (currentTheme : String) : String {
    "9999px"
  }

  /* Background Variants */
  fun getBackground (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(15, 23, 42, 1)"
    } else {
      "rgba(248, 250, 252, 1)"
    }
  }

  fun getBackgroundAlt (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 1)"
    } else {
      "rgba(241, 245, 249, 1)"
    }
  }

  /* Divider Colors */
  fun getDivider (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.12)"
    } else {
      "rgba(15, 23, 42, 0.12)"
    }
  }

  fun getDividerLight (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.08)"
    } else {
      "rgba(15, 23, 42, 0.08)"
    }
  }

  /* Scrollbar Colors */
  fun getScrollbarThumb (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.2)"
    } else {
      "rgba(15, 23, 42, 0.2)"
    }
  }

  fun getScrollbarTrack (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(30, 41, 59, 0.5)"
    } else {
      "rgba(15, 23, 42, 0.05)"
    }
  }

  /* Overlay & Backdrop */
  fun getOverlay (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(0, 0, 0, 0.6)"
    } else {
      "rgba(15, 23, 42, 0.4)"
    }
  }

  fun getOverlayHeavy (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(0, 0, 0, 0.85)"
    } else {
      "rgba(15, 23, 42, 0.7)"
    }
  }
}
