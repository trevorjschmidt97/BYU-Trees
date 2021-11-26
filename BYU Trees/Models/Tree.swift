//
//  Tree.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/6/21.
//

import Foundation

struct Tree: Identifiable, Codable {
    var ID: Int = 0
    var CommonName: String = ""
    var Culture: String = ""
    var Description: String = ""
    var Family: String = ""
    var LocationDescription: String = ""
    var ScientificName: String = ""
    var TypeDescription: String = ""
    var Images: [TreeImage]?
    var Landscape = TreeLandscape()
    var Location = TreeLocation()
    var Pests: [TreePest]?
    
    // Computed Vars
    var searchString: String {
        CommonName + Culture + Description + ScientificName + Family + LocationDescription + TypeDescription
    }
    var id: Int {
        self.ID
    }
}

// Global Example Tree
var exampleTree: Tree = Tree(ID: 0,
                             CommonName: "Jeffery Pine",
                             Culture: "<B>Brief Synopsis: </B> Jeffrey Pines are very similar to Ponderosa Pines but differ mainly because their cone is much larger (6-9” long) and Jeffrey Pines are considered more frost hardy than Ponderosa Pines. The bark and twigs of the Jeffrey Pine are pleasantly aromatic.<br/><br/><B>Pruning Recommendations:</B> Eliminate any double leaders early and prune for deadwood.  Prune for clearance as necessary. <br/><br/>For general pruning techniques, click <A HREF=\"http://www.na.fs.fed.us/Spfo/pubs/howtos/ht_prune/prun001.htm\" TARGET=\"_blank\">here.</A><br/><br/><B>Fertilizer Requirements: </B>For general fertilizer recommendations, click <A HREF=\"http://extension.usu.edu/files/publications/factsheet/HG-510.pdf\" TARGET=\"_blank\">here</A> (organic), or <A HREF=\"http://extension.usu.edu/files/publications/publication/HG_509.pdf\" TARGET=\"_blank\">here</A> (inorganic). <br/><br/><B>Water Management: </B>For general water management recommendations, click <A HREF=\"http://extension.usu.edu/files/publications/publication/HG-523.pdf\" TARGET=\"_blank\">here</A>.<br/><br/><B>Installation/Establishment Techniques: </B>Usually planted as a balled and burlapped tree. Root prune before moving. Establishes quickly.<br/><br/>To watch a video on how to plant a ball and burlapped or containerized tree, click<A HREF=\"http://www.arborday.org/trees/video/howtoplant.cfm\" TARGET=\"_blank\"> here</A>.<br/><br/><B>Tree failure patterns:</B> Tree failure is uncommon.<br/><br/><B>Other Possible Problems: </B>No major pest issues.  Aphids, borers, and black leaf scale can sometimes be problematic.<br/><br/><B>Availability:</B> May be hard to find in the nursery.<br/><br/><B>Natural Habitat: </B>Oregon to California<br/><br/><B>Growth Rate:</B> Slow<br/><br/><B>Propagation:</B> <br/><br/><B>Unique information about cultivars:</B> <br/><br/><B>Other Online Resources:</B> <br/><br/>",
                             Description: "",
                             Family: "Pinaceae",
                             LocationDescription: "South of the Marriott Center along 1430 North. (Across the street from the Thomas Bldg.)",
                             ScientificName: "Pinus jeffreyi",
                             TypeDescription: "Boasting the largest pine cones on campus (up to 9”), this is a great tree to begin our tour.  Planted about 1970, this Jeffery pine has long, slightly twisted needles in groups of three. Similar to ponderosa pine, it can reach over 60’ in height.  Native from southern Oregon to California.",
                             Images: [
                                TreeImage(Caption: "Jeffery Pine in Summer",
                                          ImageType: 0,
                                          PhotoCredit: "BYU Grounds",
                                          ThumbnailURL: "img/thumbnails/1033.jpg",
                                          URL: "img/1033.jpg"),
                                TreeImage(Caption: "Jeffery Pine in Winter",
                                          ImageType: 0,
                                          PhotoCredit: "BYU Grounds",
                                          ThumbnailURL: "img/thumbnails/1200.jpg",
                                          URL: "img/1200.jpg")
                             ],
                             Landscape: TreeLandscape(DesignFeatures: "This large tree demands wide growing spaces, but where it has room to grow it is breath taking; use as a screen or windbreak, or form lovely 'outdoor rooms' by planting this large conifer in groups of three. Jeffrey pines are ideal for use as specimen trees, or to define large outdoor spaces.  <br/>",
                                                      FlowerColor: "Inconspicuous.<br/>",
                                                      FlowerTime: "Late spring.<br/>",
                                                      Form: "Narrowly pyramidal when young, and later forms into an irregular cylindrical form. In low light conditions the lower branches often drop. At high elevations, Jeffery pines can be deformed by high winds. They also have a deep taproot with strong and extensive lateral roots that should anchor it in place if established properly while young. <br/>",
                                                      HardinessZones: "5<br/>",
                                                      LeafColor: "Dark blue-green.<br/>",
                                                      LeafType: "Evergreen needles reach 5-10\" and come in twisting groups of 2 or 3.<br/>",
                                                      LightPreferences: "Full sun. Intolerant of shady areas. <br/>",
                                                      MatureSize: "60-90'h x 25-30'w.<br/>",
                                                      PH: "Widely adaptable to both acidic and alkaline soils (pH 5.6-8.4).<br/>",
                                                      SoilMoisture: "Adapts to a variety of soils, but only moderately drought tolerant. Prefers a deep, moist, well-drained loam. In nature, Jeffery pines thrive in rocky, shallow, infertile soils. <br/>",
                                                      SpecialFeatures: "Bark and needles have a lovely fragrance that varies slightly from the Ponderosa Pine to help distinguish the two similar trees; cones are some of the largest of any conifer in Utah, reaching lengths of 6-9 inches; cones are hard, woody, and have slight prickles on the tips of the scales; fairly resistant to late frosts. Also tolerant of extreme climate changes.<br/>",
                                                      Texture: "Medium to coarse.<br/>"),
                             Location: TreeLocation(Latitude: "40.25328222222222222250000000000000",
                                                    Longitude: "-111.64972416666666666611111111110000",
                                                    NorthDegrees: 40,
                                                    NorthMinutes: 15,
                                                    NorthSeconds: 11.816,
                                                    WestDegrees: 111,
                                                    WestMinutes: 38,
                                                    WestSeconds: 59.007),
                             Pests: [
                                TreePest(ID: 1,
                                         CommonName: "Aphid",
                                         OtherInfo: "A high enough aphid population will result in the production of honeydew, a sticky sap-like substance produced by the insects. This honeydew can drip onto cars or sidewalks located beneath the trees and can be extremely difficult to clean, possibly resulting in property damage.  Common symptoms of aphid infestation include twisting and curling of leaves, and the production of a sooty, black substance on leaves and branches.<br/>",
                                         Prevention: "A dormant oil application in late winter will help suppress the aphid population. Encourage populations of ladybugs, green lacewings, and other natural aphid predators. Do not spray if numbers of biological predators are developing.<br/>",
                                         ScientificName: "Hemiptera order",
                                         Treatment: "An application of a Merit drench (according to package directions) in early spring (March/April) gives season-long control. One soluble packet of Merit (1.6-oz) will treat 24 to 48 inches of cumulative trunk diameter. Other options include use of spray oil, soaps, malathion, diazinon, or acephate (Orthene).<br/>"),
                                TreePest(ID: 9,
                                         CommonName: "Borers ",
                                         OtherInfo: "",
                                         Prevention: "Trees vary in susceptibility to borers.  Consider a nonscuseptible species if you don't want to control borers in your yard. <br/>",
                                         ScientificName: "",
                                         Treatment: "There are not a lot of insecticides available to treat this problem, but Astro is perhaps the best product for control. Recommended rate is 1 to 2 qts. per 100 gals. water. Apply to the lower branches and truck prior to adult emergence. Adult emergence varies according to pest species, host tree, environmental conditions and geographic location. Thorough coverage of bark is required for control. <br/>"),
                                TreePest(ID: 21,
                                         CommonName: "Black Pineleaf Scale",
                                         OtherInfo: "Rarely causes enough damage to be considered a major pest. Symptoms include thin cros, reddish discoloration, chlorosis, and necrosis of needles. Already stressed trees are far more suceptable then their healthier conterparts. <br/><br/>Natural predators include: <I>Prospaltella sp. </I>(A wasp parasitoid), and <I>Physcus varicornis. </I><br/><br/>",
                                         Prevention: "",
                                         ScientificName: "Nuculaspis californica",
                                         Treatment: "")
                             ]
)
