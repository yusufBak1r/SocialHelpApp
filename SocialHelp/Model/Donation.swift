//
//  Donation.swift
//  SocialHelp
//
//  Created by yusuf bakır on 12.12.2023.
//

import Foundation
class Donation {
    
    var foundationName : String
    var Statement :String
    var url : String
    var ImageName : String
    
    init(foundationName: String, Statement: String, url: String, ImageName: String) {
        self.foundationName = foundationName
        self.Statement = Statement
        self.url = url
        self.ImageName = ImageName
    }
    
   static var listFoundation : [Donation] = [
    
        .init(foundationName: "Kızılay", Statement: "İyiliğin gücüyle birey ve toplumun dirençliliğini arttırmak, insan onurunu korumak ve ızdırabını dindirmek için çalışmak.Ülkemizde ve dünyada başta kırılgan birey ve topluluklar olmak üzere bireysel ve toplumsal dirençliliği arttırmak, istisnasız her insanın onurlu yaşam hakkına riayetle ihtiyaç duyulan her yerde insan ızdırabını dindirmek için harekete geçmek, insaniyetperverlik temelinde savunuculuk faaliyetleri gerçekleştirmek.Herkes için esenlik ve güvenli yaşam.Gerek afet ve acil durumlarda gerekse olağan zamanlarda dirençlilik kazandırıcı faaliyetler ve insani yardımlarda bulunmak suretiyle bütün insanların insanca yaşamasını temin etmek", url: "https://www.kizilay.org.tr/Bagis", ImageName: "kızılay"),
        
        
        
        
        
        
        .init(foundationName: "İHH", 
              Statement: "HH İnsani Yardım Vakfı; bölge, din, dil, ırk ve mezhep ayrımı yapmaksızın dünyanın herhangi bir yerinde sıkıntıya düşmüş, felakete uğramış, zulüm görmüş, aç ve açıkta kalmış; savaş, tabii afet gibi sebeplerle mağdur olmuş, yaralanmış, sakat kalmış; evsiz, yurtsuz, tüm insanlara insani yardım ulaştırmak ve bu insanların temel hak ve hürriyetlerinin ihlal edilmesini önlemek üzere 1992 yılından bu yana çalışmaktadır. Gönüllü faaliyetlerle başlayan ve 1995 yılında kurumsallaşan bu çalışmalar kısa sürede 123 ülkeye yayılmış ve Türkiye’den tüm dünyaya ulaşan bir hayır köprüsü olmuştur.Savaş ve doğal afetlerin sebep olduğu olumsuzluklar giderilerek bireylere ve toplumlara kendi ayakları üzerinde durabilmeleri için destek olmak.Tüm dünyada yardımlaşma alanında öncülük ederek ülkeler ve kurumlar arasında iş birliğini geliştirip ortak bilinç oluşturmak.Yardıma muhtaç duruma düşmüş toplumların kişi ve kuruluşlarını güçlendirmek.Kriz anında en az zarar için en hızlı ve etkin şekilde bölgeye ulaşmak.Kalıcı projelerle kalıcı çözümler üretmek.Yoksulluğun giderilmesine ve sosyal adaletin sağlanmasına katkı sağlamak.",
              url: "https://ihh.org.tr/bagis"
              , ImageName: "İHH"),
        
        
        .init(foundationName: "Yeşil Ay",
              Statement: "Cemiyet, yurdumuzda ahlâkî ve kültürel bir kalkınma atmosferi içinde; tütün(sigara), alkol ve madde bağımlılığı gibi toplumun ve gençliğin beden ve ruh sağlığını tahrip eden bağımlılıklar yanında, kumar, internet ve teknoloji bağımlılığı gibi gençliğe ve topluma zarar veren bütün zararlı alışkanlıklarla mücadele etmek, milli kültürüne bağlı nesiller yetiştirmek amacı ile kurulmuştur.Cemiyet bu çerçevede bağımlılıklarla mücadele etmek üzere, toplumun bilinç, güç ve kaynaklarını harekete geçirir; insan onur ve saygınlığının korunması doğrultusunda her koşulda, yerde ve zamanda desteğe muhtaç insanlara yardım eder; toplumun bağımlılıklarla mücadele kapasitesinin geliştirilmesine sürekli katkıda bulunur.Bu amaç doğrultusunda ulusal ve uluslararası kamu, özel ve sivil toplum kuruluşlarıyla gerekli işbirliği ve ortak çalışma organizasyonlarını geliştirir.",
              url: "https://www.yesilay.org.tr/tr/bagis-yap",
              ImageName: "yeşilay"),
        
        
        
        .init(foundationName: "Umut Kervanı",
              Statement: "Bizler, kendimiz ve sevdiklerimiz için mutlu ve ferah bir hayat sağlamaya çalışıyorken, ne yazık ki yanı başımızda, ya da uzaklarda bizim gibi olan başka insanlar hayatta kalma mücadelesi vermektedirler!..İnsanların yaptıkları ya da doğal afetler sebebiyle kimi insanların yaşama hakkı ellerinden alınmaktadır!..Bizler, dünyanın herhangi bir yerinde, ihtiyaçlarını karşılayamayan mağdur durumdakiinsanlara ulaşmaya çalışıyoruz.Mazlum ve muhtaçların insanca yaşayabilecekleri imkanları oluşturmak, temel hak ve hürriyetlerin önündeki engelleri kaldırmak amacıyla 2013 yılında kurulan vakfımız, 2017 yılında kurumsallaşarak, her işi Allah rızası için yapmaya gayret eden, insanlığa katkıda bulunmak isteyen, insanlığa saygılı, gönüllü kardeşler olarak Türkiye genelinde, bölge ayırımı yapmadan bir çok il, ilçe, belde ve köyde kimsesizlerin yardımcısı olmak üzere faaliyet yapmaktayız.",
              url: "https://umutkervani.org.tr/bagis.html",
              ImageName: "umutKervanı"),
        
        .init(foundationName: "Aile ve Sosyal Bakanlığı",
              Statement: "Bireyin, ailenin ve toplumsal değerlerimizin korunması, güçlendirilmesi ve geliştirilmesine yönelik bütüncül ve adil sosyal hizmet modelleri geliştirmek ve uygulamak.Toplumun her bir ferdine ulaşarak etkin sosyal hizmet sunumuyla ülkemizin sosyal kalkınmasında öncü kurum olmak.",
                url: "https://www.aile.gov.tr/sayfa/bakanligimiza-yapilacak-bagislar-ve-yardimlar/", ImageName: "ailesosyal")
        
    
    ]
    
    
    
    
    
//    https://www.kizilay.org.tr/Bagis
//    https://ihh.org.tr/bagis
//    https://www.yesilay.org.tr/tr/bagis-yap
//    https://umutkervani.org.tr/bagis.html
//    https://www.aile.gov.tr/sayfa/bakanligimiza-yapilacak-bagislar-ve-yardimlar/
}
