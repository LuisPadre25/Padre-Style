# 📱 Guía de NavBar Responsive - Sistema de Simulador

## **1. 📐 ARQUITECTURA RESPONSIVE**

### **Sistema de Breakpoints**
El responsive se maneja a través de **ViewModeStore**:

```mint
// ViewModeStore.mint (líneas 28-34)
fun getViewportWidth : String {
  case viewMode {
    "mobile" => "375px"    // 📱 Móvil
    "tablet" => "768px"    // 💻 Tablet
    => "100%"              // 🖥️ Desktop (1024px+)
  }
}
```

### **Lógica de Detección**
En NavBar (líneas 66-68):
```mint
fun isMobileView : Bool {
  viewMode == "mobile" || viewMode == "tablet"
}
```

**Breakpoint crítico: 1024px** - Antes = menú hamburguesa / Después = menú horizontal

---

## **2. 🎨 DISEÑO RESPONSIVE**

### **Vista Mobile/Tablet (< 1024px)**

#### **Componentes visibles:**
1. **Logo/LogoText** (izquierda)
2. **Botón Hamburguesa** (derecha) - líneas 309-320
   - Ícono: `menu` / `x` (toggle)
   - Componente: `<Icon>` con `clickable={true}`

#### **Drawer (Menú deslizante):**
```mint
// style drawer (líneas 155-176)
position: absolute;
top: 0;
right: 0;
width: 280px;
max-width: 85%;
height: 100%;
transform: translateX(100%);  // Oculto por defecto

if isMenuOpen {
  transform: translateX(0);    // Visible al abrir
}
```

**Características del Drawer:**
- Aparece desde la **derecha** con animación slide
- Overlay oscuro (rgba(0, 0, 0, 0.5)) - líneas 136-152
- Padding: `80px 20px 24px` (espacio superior para no chocar con status bar)
- Items con estados `active` (peso 600) / normal (peso 500)
- Cierra al hacer clic en overlay o en item (líneas 34-41)

---

### **Vista Desktop (≥ 1024px)**

#### **Layout horizontal:**
```mint
// render - líneas 322-337
<Flex justify="center" align="center" gap="8px">
  {renderDesktopMenu()}
</Flex>
```

**Componentes:**
1. **Logo** (izquierda)
2. **Menu items** (centro) - horizontal con gap 8px
3. **Children/Actions** (derecha) - botones como Sign In/Up

---

## **3. 🖼️ SISTEMA DE SIMULADOR**

### **ComponentShowcase - El Contenedor**

El simulador se configura en **ComponentShowcase.mint** y tiene 3 modos:

#### **A) Mobile Simulator (líneas 307-358)**
```mint
style simulatorFrame {
  min-width: 320px;
  max-width: 375px;
  background: linear-gradient(145deg, #e8eaf0 0%, #d4d7df 50%, #c8ccd6 100%);
  border-radius: 42px;
  padding: 10px;
}
```

**Elementos del frame:**
- **Status Bar iOS** (44px altura) - hora 9:41, señal, wifi, batería
- **Notch/Camera** - div negro redondeado
- **Screen** (596px altura) - contenido scrolleable
- **Safari Bottom Bar** (50px) - navegación, URL bar
- **Botones físicos** - power (derecha), volumen (izquierda) como pseudo-elementos

#### **B) Tablet Simulator (líneas 360-411)**
```mint
style tabletFrame {
  min-width: 600px;
  max-width: 768px;
  border-radius: 32px;
}

style tabletScreen {
  height: 856px;  // Más alto que mobile
}
```

**Diferencias con mobile:**
- Dimensiones mayores
- Botón power en top-right (horizontal)
- Screen height: 856px vs 596px

#### **C) Desktop Simulator (líneas 622-717)**
```mint
style monitorFrame {
  width: 100%;
  background: linear-gradient(145deg, #e8eaf0 0%, #d4d7df 50%, #c8ccd6 100%);
  border-radius: 16px;
}
```

**Estructura:**
- **Monitor Frame** con cámara centrada arriba
- **Browser Bar** con dots (rojo/amarillo/verde) + address bar
- **Grid Layout**: `grid-template-columns: 1fr 19rem`
  - Izquierda: Preview (flex: 1)
  - Derecha: Controls (19rem fijo)
- **Stand + Base** - elementos decorativos

---

## **4. 📱 CÓMO QUEDA EN EL SIMULADOR**

### **Mobile View (375px)**
```
┌─────────────────────┐
│ 9:41    [notch]  📶│  ← Status bar
├─────────────────────┤
│ MyBrand        ☰   │  ← NavBar (64px)
│                     │
│                     │
│   Page Content      │  ← previewWrapper
│                     │
│                     │
├─────────────────────┤
│ ← → 🔒localhost  ⟳ │  ← Safari bar
└─────────────────────┘

[Controls Card]  ← Fuera del simulador
```

**Drawer abierto:**
```
┌─────────────────────┐
│ MyBrand         ✕  │
│▓▓▓▓▓▓▓▓▓▓▓┌────────┤
│▓ overlay ▓│ Home ✓ │
│▓▓▓▓▓▓▓▓▓▓▓│Products│
│▓▓▓▓▓▓▓▓▓▓▓│ About  │
│▓▓▓▓▓▓▓▓▓▓▓│ Blog   │
│▓▓▓▓▓▓▓▓▓▓▓│Contact │
│▓▓▓▓▓▓▓▓▓▓▓├────────│
│▓▓▓▓▓▓▓▓▓▓▓│Sign In │
│▓▓▓▓▓▓▓▓▓▓▓│Sign Up │
└───────────┴────────┘
```

### **Desktop View (1024px+)**
```
┌─────────────────────────────────────────────────┐
│ ● ● ●  🔒 localhost:3000                        │ ← Browser bar
├──────────────────────┬──────────────────────────┤
│                      │                          │
│  MyBrand  [Menu]     │    [Controls]            │
│                      │    Variant: [Light]      │
│                      │                          │
│   Page Content       │                          │
│                      │                          │
└──────────────────────┴──────────────────────────┘
        │
        ▼  Stand + Base decorativos
```

---

## **5. 🔑 PUNTOS CLAVE PARA RESPONSIVE**

### **En NavBar:**
1. **Conexión a ViewModeStore** (línea 8):
   ```mint
   connect ViewModeStore exposing { viewMode }
   ```

2. **Estado del menú** (línea 26):
   ```mint
   state isMenuOpen : Bool = false
   ```

3. **Toggle function** (líneas 29-31):
   ```mint
   fun toggleMenu : Promise(Void) {
     next { isMenuOpen: !isMenuOpen }
   }
   ```

4. **Render condicional** (líneas 307-349):
   ```mint
   if isMobileView() {
     /* Mobile: Show hamburger button */
     <Icon name={if isMenuOpen { "x" } else { "menu" }}
           clickable={true}
           onClick={toggleMenu} />
   } else {
     /* Desktop: Show horizontal menu */
     <Flex justify="center" align="center" gap="8px">
       {renderDesktopMenu()}
     </Flex>
   }
   ```

### **En ComponentShowcase:**
1. **ViewMode determina el frame** (líneas 1158-1309):
   ```mint
   if viewMode == "mobile" {
     <div::simulatorFrame>...</div>
   } else if viewMode == "tablet" {
     <div::tabletFrame>...</div>
   } else {
     <div::monitorFrame>...</div>
   }
   ```

2. **Preview wrapper** (NavBarPage líneas 157-166):
   ```mint
   style previewWrapper {
     position: relative;
     width: 100%;
     min-height: 100%;
     display: flex;
     flex-direction: column;
     background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
     overflow: hidden;
     isolation: isolate;  // ← CRÍTICO para que overlay funcione
   }
   ```

3. **Portal para drawer móvil** (líneas 343-349):
   ```mint
   if isMobileView() {
     <div::mobileMenuPortal>
       {renderMobileDrawer()}
     </div>
   }
   ```

---

## **6. ✅ MEJORES PRÁCTICAS IMPLEMENTADAS**

1. **Mobile-first**: Drawer optimizado para touch (padding 14px, min-height 44px)
2. **Isolation context**: `isolation: isolate` en previewWrapper evita z-index issues
3. **Smooth transitions**: `transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1)`
4. **Accesibilidad**: Overlay clickeable para cerrar, estados visuales claros
5. **Responsive adaptativo**: No media queries en NavBar, usa ViewModeStore centralizado
6. **Performance**: Render condicional evita cargar código innecesario

---

## **7. 🎯 EJEMPLO DE USO**

### **Básico:**
```mint
<NavBar
  logoText="MyBrand"
  menuItems={[
    { label: "Home", href: "/", active: true },
    { label: "About", href: "/about", active: false }
  ]}
  variant="light"
  fluid={true}
/>
```

### **Con acciones:**
```mint
<NavBar
  logoText="MyBrand"
  menuItems={getMenuItems()}
  variant="dark"
>
  <button>"Sign In"</button>
  <button>"Sign Up"</button>
</NavBar>
```

### **Con logo personalizado:**
```mint
<NavBar
  logo={<img src="logo.png" />}
  menuItems={getMenuItems()}
  variant="primary"
  height="72px"
/>
```

---

## **8. 🔧 PATRÓN DE OVERLAY + DRAWER**

Este es el patrón clave para menús móviles que funciona en el simulador:

### **Estructura HTML:**
```mint
/* 1. Portal absoluto - cubre todo */
<div::mobileMenuPortal>

  /* 2. Overlay - fondo oscuro clickeable */
  <div::overlay onClick={closeMenu}/>

  /* 3. Drawer - menú deslizante */
  <div::drawer>
    {/* contenido del menú */}
  </div>
</div>
```

### **Estilos clave:**
```mint
/* Portal - posición absoluta */
style mobileMenuPortal {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  pointer-events: none;
  z-index: 997;

  if isMenuOpen {
    pointer-events: auto;
  }
}

/* Overlay - cubre todo */
style overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1;
  opacity: 0;
  transition: opacity 0.3s cubic-bezier(0.4, 0, 0.2, 1);

  if isMenuOpen {
    opacity: 1;
  }
}

/* Drawer - slide desde derecha */
style drawer {
  position: absolute;
  top: 0;
  right: 0;
  width: 280px;
  max-width: 85%;
  height: 100%;
  background-color: #{getBgColor()};
  box-shadow: -4px 0 16px rgba(0, 0, 0, 0.2);
  z-index: 2;
  transform: translateX(100%);
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);

  if isMenuOpen {
    transform: translateX(0);
  }
}
```

### **Por qué funciona:**
1. **Portal con pointer-events**: Solo captura clicks cuando está abierto
2. **Overlay en z-index: 1**: Fondo oscuro clickeable
3. **Drawer en z-index: 2**: Menú sobre el overlay
4. **Transform en lugar de left/right**: Mejor performance (GPU accelerated)

---

## **9. 💡 RESUMEN EJECUTIVO**

### **Responsive Strategy:**
- **Breakpoint único:** 1024px (controlado por ViewModeStore)
- **< 1024px:** Hamburger menu → Drawer lateral derecho
- **≥ 1024px:** Menu horizontal centrado + actions a la derecha

### **Simulador Strategy:**
- **Mobile (375px):** iPhone frame + status bar + Safari bottom
- **Tablet (768px):** iPad frame + dimensiones mayores
- **Desktop (100%):** Monitor frame + grid 2 columnas (preview + controls)

### **Arquitectura Clave:**
1. NavBar se conecta a **ViewModeStore** para saber el viewport
2. ComponentShowcase renderiza el **frame apropiado** según viewMode
3. **previewWrapper** con `isolation: isolate` asegura que overlay/drawer funcionen
4. Controls viven **fuera del simulador** en mobile/tablet (mejor UX)

### **Referencias de código:**
- NavBar responsive logic: `source/modules/navigation/NavBar.mint:66-68`
- Simulador mobile: `source/modules/display/ComponentShowcase.mint:307-358`
- Drawer styling: `source/modules/navigation/NavBar.mint:155-176`
- ViewModeStore: `source/stores/ViewModeStore.mint:28-34`

---

## **10. 🚀 CHECKLIST PARA NUEVOS COMPONENTES RESPONSIVE**

Al crear un componente responsive similar, asegúrate de:

- [ ] Conectar a ViewModeStore: `connect ViewModeStore exposing { viewMode }`
- [ ] Crear función `isMobileView()` o similar
- [ ] Implementar render condicional basado en viewMode
- [ ] Para overlays/modals: usar `isolation: isolate` en el contenedor padre
- [ ] Para drawers: usar patrón Portal + Overlay + Drawer
- [ ] Usar `transform` para animaciones (no left/right)
- [ ] Agregar `pointer-events: none/auto` en portales
- [ ] Configurar z-index apropiado (portal: 997, overlay: 1, drawer: 2)
- [ ] Agregar transitions con cubic-bezier para suavidad
- [ ] Testear en los 3 modos del simulador

---

**Última actualización:** 2025-10-10
**Autor:** Sistema de documentación automático
