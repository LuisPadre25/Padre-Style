# 📚 Estructura de Componentes - Mint Wū

## 🎯 Categorías de Componentes

Siguiendo el estándar de Vant UI, Ant Design y Zent UI, los componentes están organizados por categorías funcionales.

---

## 📋 Categorías Definidas

### 1. **Essentials** (Esenciales)
Documentación, guías y recursos básicos.

```
- Introduction
- Quickstart
- Advanced Usage
- FAQ
- Changelog
- Contribution Guide
```

---

### 2. **Basic Components** (Componentes Básicos)
Componentes fundamentales para UI.

```
modules/button/          → Button
modules/cell/            → Cell
modules/icon/            → Icon
modules/image/           → Image
modules/layout/          → Layout
modules/popup/           → Popup
modules/toast/           → Toast
```

**Ejemplos reales:**
- Button: Botones con variants (primary, secondary, danger)
- Cell: Células de lista con iconos y flechas
- Icon: Sistema de iconos
- Layout: Grid, Flex, Container

---

### 3. **Form Components** (Componentes de Formulario)
Componentes para entrada de datos.

```
modules/calendar/        → Calendar
modules/cascader/        → Cascader
modules/checkbox/        → Checkbox
modules/datepicker/      → DatePicker
modules/field/           → Field (Input)
modules/form/            → Form
modules/radio/           → Radio
modules/rate/            → Rate
modules/select/          → Select
modules/slider/          → Slider
modules/switch/          → Switch
modules/textarea/        → Textarea
modules/uploader/        → Uploader
```

---

### 4. **Display Components** (Componentes de Visualización)
Componentes para mostrar información.

```
modules/badge/           → Badge
modules/card/            → Card
modules/carousel/        → Carousel
modules/circle/          → Circle (Progress Circle)
modules/collapse/        → Collapse
modules/countdown/       → CountDown
modules/divider/         → Divider
modules/empty/           → Empty
modules/list/            → List
modules/notice-bar/      → NoticeBar
modules/progress/        → Progress
modules/skeleton/        → Skeleton
modules/steps/           → Steps
modules/swipe/           → Swipe
modules/tag/             → Tag
```

---

### 5. **Navigation Components** (Componentes de Navegación)
Componentes para navegación.

```
modules/action-bar/      → ActionBar
modules/back-top/        → BackTop
modules/breadcrumb/      → Breadcrumb
modules/grid/            → Grid
modules/index-bar/       → IndexBar
modules/navbar/          → NavBar
modules/pagination/      → Pagination
modules/sidebar/         → Sidebar
modules/tab/             → Tab
modules/tabbar/          → Tabbar
modules/tree-select/     → TreeSelect
```

---

### 6. **Feedback Components** (Componentes de Retroalimentación)
Componentes para feedback del usuario.

```
modules/action-sheet/    → ActionSheet
modules/dialog/          → Dialog
modules/dropdown-menu/   → DropdownMenu
modules/loading/         → Loading
modules/notify/          → Notify
modules/overlay/         → Overlay
modules/pull-refresh/    → PullRefresh
modules/share-sheet/     → ShareSheet
modules/swipe-cell/      → SwipeCell
```

---

### 7. **Tools** (Herramientas)
Utilidades y herramientas especiales.

```
modules/qrcode/          → QR Code Generator
  ├── QRCodeCanvas.mint
  └── QREncoder.mint

modules/barcode/         → Barcode Generator
  ├── BarcodeCanvas.mint
  └── Code128.mint
```

---

## 🗂️ Estructura de Archivos por Categoría

```
source/
├── modules/                    # COMPONENTES CORE por categoría
│   │
│   ├── basic/                  # Basic Components
│   │   ├── button/
│   │   │   └── Button.mint
│   │   ├── cell/
│   │   │   └── Cell.mint
│   │   └── icon/
│   │       └── Icon.mint
│   │
│   ├── form/                   # Form Components
│   │   ├── checkbox/
│   │   │   └── Checkbox.mint
│   │   ├── input/
│   │   │   └── Input.mint
│   │   └── select/
│   │       └── Select.mint
│   │
│   ├── display/                # Display Components
│   │   ├── badge/
│   │   │   └── Badge.mint
│   │   ├── card/
│   │   │   └── Card.mint
│   │   └── progress/
│   │       └── Progress.mint
│   │
│   ├── navigation/             # Navigation Components
│   │   ├── breadcrumb/
│   │   │   └── Breadcrumb.mint
│   │   └── pagination/
│   │       └── Pagination.mint
│   │
│   ├── feedback/               # Feedback Components
│   │   ├── dialog/
│   │   │   └── Dialog.mint
│   │   └── loading/
│   │       └── Loading.mint
│   │
│   └── tools/                  # Tools (herramientas especiales)
│       ├── qrcode/
│       │   ├── QRCodeCanvas.mint
│       │   └── QREncoder.mint
│       └── barcode/
│           ├── BarcodeCanvas.mint
│           └── Code128.mint
│
└── views/                      # PÁGINAS de ejemplos por categoría
    ├── basic/
    │   ├── button/
    │   │   ├── ButtonPage.mint
    │   │   └── ButtonExamples.mint
    │   └── cell/
    │       └── CellPage.mint
    │
    ├── form/
    │   └── checkbox/
    │       └── CheckboxPage.mint
    │
    ├── display/
    │   └── badge/
    │       └── BadgePage.mint
    │
    ├── navigation/
    │   └── breadcrumb/
    │       └── BreadcrumbPage.mint
    │
    ├── feedback/
    │   └── dialog/
    │       └── DialogPage.mint
    │
    └── tools/
        └── codes/              # QR & Barcodes (ya existe)
            ├── CodesPage.mint
            ├── CodeStore.mint
            └── CodeExamples.mint
```

---

## 📊 Estado Actual del Proyecto

### ✅ Implementado
```
modules/tools/qrcode/         → QRCodeCanvas.mint, QREncoder.mint
modules/tools/barcode/        → BarcodeCanvas.mint, Code128.mint
views/tools/codes/            → CodesPage.mint (con 24 ejemplos)
```

### 🔲 Pendiente
Todos los demás componentes de las categorías:
- Basic Components (Button, Cell, Icon, etc.)
- Form Components (Checkbox, Input, Select, etc.)
- Display Components (Badge, Card, Progress, etc.)
- Navigation Components (Breadcrumb, Pagination, etc.)
- Feedback Components (Dialog, Loading, etc.)

---

## 🚀 Cómo Agregar un Nuevo Componente

### Ejemplo: Agregar "Button" en Basic Components

#### PASO 1: Crear el módulo
```bash
mkdir -p source/modules/basic/button
```

**source/modules/basic/button/Button.mint**:
```mint
component Button {
  property label : String = "Click me"
  property variant : String = "primary"
  property size : String = "medium"
  property disabled : Bool = false

  style button {
    padding: 8px 16px;
    border-radius: 4px;
    border: none;
    cursor: pointer;
    font-size: 14px;
    transition: all 0.3s;

    &.primary {
      background: #1989fa;
      color: white;

      &:hover {
        background: #0c7cd5;
      }
    }

    &.secondary {
      background: #f7f8fa;
      color: #323233;

      &:hover {
        background: #e8eaed;
      }
    }

    &.danger {
      background: #ee0a24;
      color: white;

      &:hover {
        background: #c80919;
      }
    }

    &.disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    if !disabled {
      Promise.resolve(void)
    } else {
      Promise.resolve(void)
    }
  }

  fun render : Html {
    <button::button
      class={variant + " " + size + " " + (if disabled { "disabled" } else { "" })}
      onClick={handleClick}
      disabled={disabled}>

      {label}
    </button>
  }
}
```

#### PASO 2: Crear la view (página de ejemplos)
```bash
mkdir -p source/views/basic/button
```

**source/views/basic/button/ButtonPage.mint**:
```mint
component ButtonPage {
  style container {
    padding: 32px;
  }

  style section {
    margin-bottom: 40px;
  }

  style title {
    font-size: 24px;
    margin-bottom: 16px;
  }

  style subtitle {
    font-size: 16px;
    color: #646566;
    margin-bottom: 20px;
  }

  style demo {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
    margin-bottom: 20px;
  }

  fun render : Html {
    <div::container>
      <h1::title>"Button"</h1>
      <p::subtitle>"Button component with multiple variants and sizes"</p>

      <div::section>
        <h2>"Type"</h2>
        <div::demo>
          <Button label="Primary" variant="primary"/>
          <Button label="Secondary" variant="secondary"/>
          <Button label="Danger" variant="danger"/>
        </div>
      </div>

      <div::section>
        <h2>"Size"</h2>
        <div::demo>
          <Button label="Large" size="large"/>
          <Button label="Medium" size="medium"/>
          <Button label="Small" size="small"/>
        </div>
      </div>

      <div::section>
        <h2>"Disabled"</h2>
        <div::demo>
          <Button label="Disabled" variant="primary" disabled={true}/>
          <Button label="Disabled" variant="secondary" disabled={true}/>
        </div>
      </div>
    </div>
  }
}
```

#### PASO 3: Agregar ruta en Routes.mint
```mint
/button {
  NavigationStore.setPageAndSection("button", "Basic Components")
}
```

#### PASO 4: Agregar en Sidebar.mint (ya está en "Basic Components")
Ya está listado en el grupo "Basic Components".

#### PASO 5: Actualizar PageContent.mint
```mint
case currentPage {
  "button" =>
    <ButtonPage/>

  // ... otros casos
}
```

---

## 📚 Convenciones de Nombres

### Módulos (componentes reutilizables)
- Carpeta: `modules/{category}/{component}/`
- Archivo: `{ComponentName}.mint`
- Ejemplo: `modules/basic/button/Button.mint`

### Views (páginas de ejemplos)
- Carpeta: `views/{category}/{component}/`
- Archivo: `{ComponentName}Page.mint`
- Ejemplo: `views/basic/button/ButtonPage.mint`

### Rutas
- Pattern: `/{component-name}`
- Ejemplo: `/button`, `/checkbox`, `/qr-code`

---

## 🎨 Guía de Estilos por Categoría

### Basic Components
- Diseño simple y limpio
- Colores primarios de la marca
- Fácil de usar y entender

### Form Components
- Validación visual clara
- Estados: default, focus, error, disabled
- Labels y placeholders descriptivos

### Display Components
- Presentación de información clara
- Uso de iconos cuando sea apropiado
- Responsive design

### Navigation Components
- Navegación intuitiva
- Indicadores de estado actual
- Transiciones suaves

### Feedback Components
- Mensajes claros
- Iconos descriptivos
- Animaciones sutiles

### Tools
- Funcionalidad específica
- Documentación detallada
- Ejemplos de uso real

---

## 📊 Roadmap de Implementación

### Fase 1: Basic Components (Prioridad Alta)
- [ ] Button
- [ ] Cell
- [ ] Icon
- [ ] Image
- [ ] Layout

### Fase 2: Form Components (Prioridad Alta)
- [ ] Checkbox
- [ ] Input (Field)
- [ ] Radio
- [ ] Select
- [ ] Switch

### Fase 3: Display Components (Prioridad Media)
- [ ] Badge
- [ ] Card
- [ ] Progress
- [ ] Tag
- [ ] Empty

### Fase 4: Navigation Components (Prioridad Media)
- [ ] Breadcrumb
- [ ] Pagination
- [ ] Tab
- [ ] Navbar

### Fase 5: Feedback Components (Prioridad Baja)
- [ ] Dialog
- [ ] Loading
- [ ] Notify
- [ ] Toast

### Fase 6: Tools (Según necesidad)
- [x] QR & Barcodes (implementado)
- [ ] ColorPicker
- [ ] ImageCropper

---

## 🏆 Referencias de UI Libraries

- **Vant UI**: https://vant-ui.github.io/vant
- **Ant Design**: https://ant.design/components
- **Zent UI**: https://youzan.github.io/zent
- **Element Plus**: https://element-plus.org/en-US/component
- **Naive UI**: https://www.naiveui.com/en-US/os-theme/components

---

**Última actualización**: 2025-01-04
**Categorías**: 7 (Essentials, Basic, Form, Display, Navigation, Feedback, Tools)
**Componentes implementados**: 2 (QRCode, Barcode)
**Componentes planificados**: 50+
