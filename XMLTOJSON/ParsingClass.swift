//
//  MainStructs.swift
//  xmlParser
//
//  Created by Matej Hetzel on 21/10/2019.
//  Copyright © 2019 Matej Hetzel. All rights reserved.
//

import Foundation
class ParsingClass {
    var table: [Tables]
    
    init(table: [Tables]){
        self.table = table
    }
}

struct Tables {
    var column: [Columns]
}

struct Columns {
    var name: String
}


struct MainClass {
    var postmeta: [PostMeta]
    var posts: [Posts]
    var termdata: [Termdata]
    var terms: [Terms]
    var termRelationships: [TermRelationships]
    var termTaxonomy: [TermTaxonomy]
}


struct PostMeta {
    var metaID: String
    var postID: String
    var metaKey: String
    var metaValue: String
}

struct Posts {
    var ID: String
    var postTitle: String
}
struct Termdata {
    var metaID: String
    var termID: String
    var metaKey: String
    var metaValue: String
}

struct Terms {
    var termID: String
    var name: String
    var slug: String
}

struct TermRelationships {
    var objectID: String
    var termTaxonomyID: String
    var termOrder: String
}

struct TermTaxonomy {
    var termTaxnomyID: String
    var termID: String
    var taxonomy: String
    var description: String
    var parent: String
}
