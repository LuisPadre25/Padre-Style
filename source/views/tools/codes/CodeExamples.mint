module CodeExamples {
  fun getQRExamples : Array(CodeExample) {
    [
      {
        title: "Website URL",
        content: "https://mint-lang.com",
        description: "Escanea para visitar el sitio web oficial de Mint Lang"
      },
      {
        title: "Email Contact",
        content: "mailto:contact@example.com?subject=Hello&body=Hi there!",
        description: "Escanea para enviar un email preconfigurado"
      },
      {
        title: "WiFi Network",
        content: "WIFI:T:WPA;S:MiRed;P:password123;H:false;;",
        description: "Escanea para conectarte automáticamente a WiFi"
      },
      {
        title: "Phone Number",
        content: "tel:+1234567890",
        description: "Escanea para llamar directamente"
      },
      {
        title: "SMS Message",
        content: "sms:+1234567890?body=Hello from Mint Lang!",
        description: "Escanea para enviar SMS preconfigurado"
      },
      {
        title: "vCard Contact",
        content:
          "BEGIN:VCARD\\nVERSION:3.0\\nFN:John Doe\\nTEL:+1234567890\\nEMAIL:john@example.com\\nEND:VCARD",
        description: "Escanea para agregar contacto a tu teléfono"
      },
      {
        title: "Geolocation",
        content: "geo:37.7749,-122.4194",
        description: "Escanea para abrir ubicación en mapas (San Francisco)"
      },
      {
        title: "Event Calendar",
        content:
          "BEGIN:VEVENT\\nSUMMARY:Mint Lang Workshop\\nDTSTART:20250201T100000\\nDTEND:20250201T120000\\nEND:VEVENT",
        description: "Escanea para agregar evento al calendario"
      },
      {
        title: "Payment (Bitcoin)",
        content: "bitcoin:1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa?amount=0.001",
        description: "Escanea para realizar pago con Bitcoin"
      },
      {
        title: "WhatsApp Message",
        content: "https://wa.me/1234567890?text=Hello from Mint Lang!",
        description: "Escanea para enviar mensaje de WhatsApp"
      },
      {
        title: "YouTube Video",
        content: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
        description: "Escanea para ver video en YouTube"
      },
      {
        title: "JSON Data",
        content:
          "{\\\"name\\\":\\\"Mint Lang\\\",\\\"type\\\":\\\"Programming Language\\\",\\\"year\\\":2025}",
        description: "Escanea para obtener datos JSON estructurados"
      }
    ]
  }

  fun getBarcodeExamples : Array(CodeExample) {
    [
      {
        title: "Product SKU",
        content: "PROD-2025-001",
        description: "Código de producto para inventario"
      },
      {
        title: "Order Number",
        content: "ORD-20250104-ABC123",
        description: "Número de orden para seguimiento"
      },
      {
        title: "Serial Number",
        content: "SN-MINT-78945612",
        description: "Número de serie de dispositivo"
      },
      {
        title: "License Plate",
        content: "ABC-1234",
        description: "Placa de vehículo"
      },
      {
        title: "Batch Code",
        content: "BATCH-A-2025-01",
        description: "Código de lote de producción"
      },
      {
        title: "Tracking Code",
        content: "TRACK-XYZ-456789",
        description: "Código de rastreo de paquete"
      },
      {
        title: "ISBN Book",
        content: "ISBN-978-3-16-148410-0",
        description: "Código ISBN de libro"
      },
      {
        title: "Membership ID",
        content: "MEMBER-GOLD-9876",
        description: "ID de membresía premium"
      },
      {
        title: "Ticket Number",
        content: "TICKET-2025-A1B2C3",
        description: "Número de ticket de evento"
      },
      {
        title: "Asset Tag",
        content: "ASSET-IT-LAPTOP-042",
        description: "Etiqueta de activo empresarial"
      },
      {
        title: "Coupon Code",
        content: "DISCOUNT-50OFF-2025",
        description: "Código de cupón de descuento"
      },
      {
        title: "Container ID",
        content: "CONT-PORT-A-5678",
        description: "ID de contenedor de carga"
      }
    ]
  }
}
