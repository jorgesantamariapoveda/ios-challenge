//
//  PropertyDetailView.swift
//  Idealista
//
//  Created by Jorge on 23/10/24.
//

import SwiftUI

struct PropertyDetailView: View {
    let representable: PropertyRepresentable
    
    @State private var showFullComment = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                propertySection
                threeButtonsSection
                advertiserCommentSection
            }
            .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $showFullComment) {
            advertiserFullCommentSection
        }
        .padding()
    }
    
    private var propertySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(representable.address)
                .font(.body)
                .fontWeight(.semibold)
            Text(representable.price)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Text(representable.rooms)
                Text(representable.size)
            }
            .font(.caption)
            .padding(.bottom, 8)
        }
    }
    
    private var threeButtonsSection: some View {
        HStack(alignment: .center) {
            ButtonDetailView(title: "Guardar", systemName: "heart") {
                print("limit::")
            }
            ButtonDetailView(title: "Descartar", systemName: "trash") {
                print("limit::")
            }
            ButtonDetailView(title: "Compartir", systemName: "square.and.arrow.up") {
                print("limit::")
            }
        }
    }
    
    private var advertiserCommentSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Comentario del anunciante")
                .font(.title2)
                .fontWeight(.bold)
            Text(comentario)
                .font(.caption)
                .lineLimit(5)
            ButtonDetailView(title: "Ir al comentario completo") {
                showFullComment.toggle()
            }
        }
    }
    
    private var advertiserFullCommentSection: some View {
        VStack {
            HStack(alignment: .center, spacing: 16) {
                Text("Comentario del anunciante")
                    .font(.callout)
                    .fontWeight(.bold)
            }
            .padding(.top)
            .padding(.horizontal)
            
            Divider()
            
            ScrollView(showsIndicators: false) {
                Text(comentario)
                    .font(.footnote)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    let property = Property(
        id: "1",
        imagesUrl: [
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp",
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/79/6b/e0/1273036729.webp",
            "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/00/c5/91/1273036730.webp",
        ],
        address: "calle de Lagasca".capitalizeFirstWord(),
        priceAmount: 1195000.0,
        priceCurrencySuffix: "€",
        isParkingSpaceIncludedInPrice: true,
        rooms: 3,
        size: 133.0
    )
    
    let representable = PropertyRepresentable(domainModel: property)
    
    PropertyDetailView(representable: representable)
}

let comentario = """
Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca, zona Castellana, con 3 dormitorios (uno en suite), 2 baños, amplio salón comedor, cocina independiente con office y lavadero. Cuenta con un amplio patio privado y armarios empotrados en todas las habitaciones. Reformado para optimizar el espacio, ofrece gran potencial para personalizarlo. Ubicado en una de las zonas más exclusivas de Madrid, el Barrio de Salamanca, en la cotizada zona de Castellana, se encuentra este espacioso piso en venta de 133 m² que ofrece una oportunidad única para quienes buscan una vivienda que combine comodidad, ubicación y potencial de actualización. El inmueble cuenta con un salón -comedor, amplio y luminoso, es perfecto para disfrutar de momentos de convivencia con la familia o amigos, y está conectado a un patio de uso privativo, una verdadera joya en pleno centro de la ciudad. Este espacio exterior es ideal para relajarse, organizar comidas al aire libre o incluso para ser transformado en una zona verde que aporte tranquilidad y frescura al hogar. La cocina es independiente y dispone de una cómoda zona de office, perfecta para las comidas cotidianas, además de contar con un práctico lavadero adjunto que facilita las tareas del hogar. Además, dispone de tres amplios dormitorios, destacando el dormitorio principal, que es una suite completa con un baño privado, ofreciendo privacidad y confort. Los otros dos dormitorios también disponen de armarios empotrados, maximizando el almacenamiento en cada habitación.El piso incluye dos cuartos de baño completos, con un diseño moderno y funcional, ideales para el día a día de una familia o para invitados. Cabe destacar que este piso ha sido previamente reformado con una distribución que aprovecha al máximo el espacio disponible, brindando una excelente base para que puedas personalizarlo según tus gustos y necesidades.  MUCHAS DE NUESTRAS PROPIEDADES NO APARECEN EN IDEALISTA, CONSULTA NUESTRA PÁGINA WEB PARA VER MÁS PROPIEDADES EXCLUSIVAS. Sin duda, el distrito selecto por excelencia de Madrid. Pasear por las calles del barrio de Salamanca es contemplar los edificios más elegantes y codiciados de la capital: construcciones históricas de portales señoriales e interiores amplios y altos. Concebido en las últimas décadas del siglo XIX por D. José de Salamanca y Mayol, Marqués de Salamanca, este ensanche de la ciudad conserva intacto su aire aristocrático, que podemos ver en palacetes como el de la Embajada de Italia, por ejemplo. En este epicentro del lujo se localiza la conocida “Milla de Oro”: un área comercial donde tienen su sede marcas prestigiosas como Dior, Chanel, Prada o Tiffany y Promora. Tiendas como Gallery, BD o Vitra y restaurantes como Ramsés o No, responden a los gustos de un life style moderno y sofisticado. Hablamos de una zona dinámica y segura, de grandes aceras, con un parking casi ilimitado y con una interesante vida nocturna: Nxt Club, Déjate Besar o Le Boutique Club. No faltan las galerías de arte y los espacios dedicados a la cultura como la Fundación March o el museo Lázaro Galdiano. Sin olvidar sus árboles frondosos y la cercanía al parque del Retiro, el gran pulmón verde del centro de Madrid.
"""
