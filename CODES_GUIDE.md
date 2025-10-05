# 📱 Guía de Uso: QR Codes & Barcodes

## 🎯 Descripción General

Sistema completo de generación de **QR Codes** y **Barcodes CODE128** implementado 100% en Mint Lang con ejemplos interactivos de casos de uso reales.

---

## 📱 QR Code Generator

### ¿Qué es un QR Code?

QR (Quick Response) es un código de barras bidimensional que puede almacenar hasta **4,296 caracteres alfanuméricos**. Los smartphones pueden escanearlos con la cámara.

### 🎨 Niveles de Corrección de Errores

- **L (Low)** - 7% de recuperación - Ideal para ambientes limpios
- **M (Medium)** - 15% de recuperación - **Recomendado para uso general**
- **Q (Quartile)** - 25% de recuperación - Para ambientes con polvo/suciedad
- **H (High)** - 30% de recuperación - Códigos que pueden dañarse parcialmente

### 📚 Ejemplos de Uso

#### 1️⃣ **Website URL**
```
https://mint-lang.com
```
**Uso:** Marketing, tarjetas de presentación, carteles

---

#### 2️⃣ **Email Contact**
```
mailto:contact@example.com?subject=Hello&body=Hi there!
```
**Uso:** Formularios de contacto rápido, soporte técnico

---

#### 3️⃣ **WiFi Network** 🔥
```
WIFI:T:WPA;S:MiRed;P:password123;H:false;;
```
**Formato:**
- `T:` Tipo de seguridad (WPA/WEP/nopass)
- `S:` Nombre de la red (SSID)
- `P:` Contraseña
- `H:` Red oculta (true/false)

**Uso:** Hoteles, cafeterías, oficinas - ¡Conexión automática!

---

#### 4️⃣ **Phone Number**
```
tel:+1234567890
```
**Uso:** Llamadas directas desde el código

---

#### 5️⃣ **SMS Message**
```
sms:+1234567890?body=Hello from Mint Lang!
```
**Uso:** Campañas de SMS, encuestas, votaciones

---

#### 6️⃣ **vCard Contact** 📇
```
BEGIN:VCARD
VERSION:3.0
FN:John Doe
TEL:+1234567890
EMAIL:john@example.com
END:VCARD
```
**Uso:** Networking events, tarjetas de presentación digitales

---

#### 7️⃣ **Geolocation**
```
geo:37.7749,-122.4194
```
**Uso:** Mapas, direcciones, ubicación de tiendas

---

#### 8️⃣ **Event Calendar**
```
BEGIN:VEVENT
SUMMARY:Mint Lang Workshop
DTSTART:20250201T100000
DTEND:20250201T120000
END:VEVENT
```
**Uso:** Invitaciones a eventos, conferencias

---

#### 9️⃣ **Payment (Bitcoin)**
```
bitcoin:1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa?amount=0.001
```
**Uso:** Pagos con criptomonedas

---

#### 🔟 **WhatsApp Message**
```
https://wa.me/1234567890?text=Hello from Mint Lang!
```
**Uso:** Soporte por WhatsApp, marketing directo

---

#### 1️⃣1️⃣ **YouTube Video**
```
https://www.youtube.com/watch?v=dQw4w9WgXcQ
```
**Uso:** Tutoriales, publicidad, contenido multimedia

---

#### 1️⃣2️⃣ **JSON Data**
```json
{"name":"Mint Lang","type":"Programming Language","year":2025}
```
**Uso:** Transferencia de datos estructurados, configuraciones

---

## 📊 CODE128 Barcode Generator

### ¿Qué es CODE128?

CODE128 es un código de barras **lineal de alta densidad** que soporta todos los caracteres ASCII (32-127). Usado en logística, inventario y retail.

### 📚 Ejemplos de Uso

#### 1️⃣ **Product SKU**
```
PROD-2025-001
```
**Uso:** Identificación de productos en inventario

---

#### 2️⃣ **Order Number**
```
ORD-20250104-ABC123
```
**Uso:** Seguimiento de pedidos, e-commerce

---

#### 3️⃣ **Serial Number**
```
SN-MINT-78945612
```
**Uso:** Identificación única de dispositivos/equipos

---

#### 4️⃣ **License Plate**
```
ABC-1234
```
**Uso:** Control de acceso vehicular, estacionamientos

---

#### 5️⃣ **Batch Code**
```
BATCH-A-2025-01
```
**Uso:** Trazabilidad de producción, calidad

---

#### 6️⃣ **Tracking Code**
```
TRACK-XYZ-456789
```
**Uso:** Rastreo de paquetes, logística

---

#### 7️⃣ **ISBN Book**
```
ISBN-978-3-16-148410-0
```
**Uso:** Identificación de libros, bibliotecas

---

#### 8️⃣ **Membership ID**
```
MEMBER-GOLD-9876
```
**Uso:** Tarjetas de membresía, programas de lealtad

---

#### 9️⃣ **Ticket Number**
```
TICKET-2025-A1B2C3
```
**Uso:** Eventos, conciertos, sorteos

---

#### 🔟 **Asset Tag**
```
ASSET-IT-LAPTOP-042
```
**Uso:** Control de activos empresariales, inventario IT

---

#### 1️⃣1️⃣ **Coupon Code**
```
DISCOUNT-50OFF-2025
```
**Uso:** Cupones de descuento, promociones

---

#### 1️⃣2️⃣ **Container ID**
```
CONT-PORT-A-5678
```
**Uso:** Logística portuaria, contenedores de carga

---

## 🚀 Cómo Usar

### En la Aplicación

1. **Navega a** `/codes`
2. **Click en cualquier ejemplo** para cargarlo automáticamente
3. **El código se genera en tiempo real**
4. **Escanea con tu smartphone** para probar

### Características Técnicas

- ✅ **Generación en tiempo real**
- ✅ **12 ejemplos de QR** con casos de uso reales
- ✅ **12 ejemplos de Barcode** para diferentes industrias
- ✅ **Click-to-load** - Un click y listo
- ✅ **100% escaneable** - Códigos reales que funcionan
- ✅ **Responsive design** - Se adapta a cualquier pantalla

---

## 🎯 Casos de Uso por Industria

### 🏪 Retail / E-commerce
- Product SKU
- Order Number
- Coupon Code
- Tracking Code

### 🏢 Empresarial
- Asset Tag
- Membership ID
- vCard Contact
- Serial Number

### 🎫 Eventos
- Ticket Number
- Event Calendar
- WiFi Network
- Geolocation

### 📦 Logística
- Container ID
- Batch Code
- Tracking Code
- License Plate

### 📱 Marketing Digital
- Website URL
- WhatsApp Message
- YouTube Video
- Social Media Links

---

## 💡 Tips & Best Practices

### Para QR Codes

1. **Usa error correction M o Q** para uso general
2. **Mantén URLs cortas** para QR más pequeños
3. **Prueba con varios lectores** antes de imprimir
4. **Añade margen blanco** alrededor del código
5. **Mínimo 2cm x 2cm** para impresión

### Para Barcodes

1. **Usa solo caracteres ASCII** (32-127)
2. **Evita caracteres especiales** complejos
3. **Mantén códigos cortos** cuando sea posible
4. **Alto mínimo: 1cm** para escaneo confiable
5. **Contraste alto** (negro sobre blanco)

---

## 🔧 Integración

### Copiar Librerías

```bash
# Las librerías están en:
source/libraries/qrcode/QREncoder.mint
source/libraries/barcode/Code128.mint

# Cópialas a tu proyecto Mint
```

### Usar en tu Componente

```mint
// Generar QR
qrMatrix = QREncoder.generate("https://example.com", "M")
qrSize = QREncoder.getSize("https://example.com")

// Generar Barcode
barcodePattern = Code128.generateBarcode("PRODUCT-123")
barcodeWidth = Code128.getBarcodeWidth("PRODUCT-123")
```

---

## 📊 Performance

- **Bundle Size:** 91.0KB (comprimido)
- **Tiempo de generación:** < 50ms
- **Soporte:** Todos los navegadores modernos
- **Mobile-ready:** ✅ iOS & Android

---

## 🎓 Referencias

- [QR Code Standard (ISO/IEC 18004)](https://www.iso.org/standard/62021.html)
- [CODE128 Specification](https://en.wikipedia.org/wiki/Code_128)
- [Mint Lang Documentation](https://mint-lang.com)

---

**Desarrollado con** ❤️ **usando Mint Lang 0.28.0**

🚀 **100% Mint Lang** | 📱 **Real Scannable Codes** | ⚡ **High Performance**
