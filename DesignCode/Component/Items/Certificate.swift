import SwiftUI


struct Certificate: View
{
    var body: some View
    {
        VStack(alignment: .leading)
        {
            VStack(alignment: .leading, spacing: 8)
            {
//                Text("SwiftUI for iOS 15")
//                    .font(.title3.weight(.semibold))
//
//                Text("Certificate")
//                    .font(.subheadline.weight(.medium))
//                    .foregroundStyle(.secondary)
                Text("作者：宋柏君")
                    .font(.title3.weight(.semibold))
                
                Text("Baijun Song")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 8)
            {
                Text("Feb 25, 2022".uppercased())
                    .font(.footnote.weight(.semibold))
                
                Text("随便写点啥吧，词穷啊")
                    .font(.footnote.weight(.medium))
            }
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .mask(RoundedRectangle(cornerRadius: 9.5, style: .continuous))
                .padding(8.0)
                .background(Color(.systemBackground).opacity(0.1), in: RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                .customBorderStroke(cornerRadius: 15.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        )
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .customBorderStroke(cornerRadius: 30)
    }
}


struct Certificate_Previews: PreviewProvider
{
    static var previews: some View
    {
        Certificate()
    }
}
