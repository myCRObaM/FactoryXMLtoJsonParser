//
//  MyParser.swift
//  xmlParser
//
//  Created by Matej Hetzel on 21/10/2019.
//  Copyright © 2019 Matej Hetzel. All rights reserved.
//

import Foundation
public class MyParser: NSObject, XMLParserDelegate {
    
    var items = [ParsingClass]()
    var columns = [Columns]()
    var elementName: String = String()
    var typeEnum: TypeEnum!
    var stringsArray = [String]()
    
    var mainClass: MainClass!
    var postMeta = [PostMeta]()
    var posts = [Posts]()
    var termData = [Termdata]()
    var terms = [Terms]()
    var termRelationships = [TermRelationships]()
    var termTaxonomoy = [TermTaxonomy]()
    
    
    func returnParsedClass() -> MainClass{
        
        if let path = Bundle.main.url(forResource: "klopa", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        
        print(items.count)
        mainClass = MainClass(postmeta: postMeta, posts: posts, termdata: termData, terms: terms, termRelationships: termRelationships, termTaxonomy: termTaxonomoy)
        
        return mainClass
    }
    
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if elementName == "table" {
            items.append(ParsingClass(table: [Tables(column: columns)]))
            self.columns.removeAll()
            
            if typeEnum != nil {
                switch typeEnum {
                case .some(.post):
                    posts.append(Posts(ID: stringsArray[1], postTitle: stringsArray[10]))
                    stringsArray.removeAll()
                case .none:
                    return
                case .some(.postMeta):
                    postMeta.append(PostMeta(metaID: stringsArray[1], postID: stringsArray[3], metaKey: stringsArray[5], metaValue: stringsArray[7]))
                    stringsArray.removeAll()
                case .some(.termMeta):
                    termData.append(Termdata(metaID: stringsArray[1], termID: stringsArray[3], metaKey: stringsArray[5], metaValue: stringsArray[7]))
                    stringsArray.removeAll()
                case .some(.terms):
                    terms.append(Terms(termID: stringsArray[1], name: stringsArray[3], slug: stringsArray[5]))
                    stringsArray.removeAll()
                case .some(.termRelationships):
                    termRelationships.append(TermRelationships(objectID: stringsArray[1], termTaxonomyID: stringsArray[3], termOrder: stringsArray[5]))
                    stringsArray.removeAll()
                case .some(.termTaxonomy):
                    termTaxonomoy.append(TermTaxonomy(termTaxnomyID: stringsArray[1], termID: stringsArray[3], taxonomy: stringsArray[5], description: stringsArray[6], parent: stringsArray[8]))
                    stringsArray.removeAll()
                }
            }
            if attributeDict.values.first == "wp_term_taxonomy" {
                typeEnum = .termTaxonomy
            }
            if attributeDict.values.first == "wp_postmeta" {
                typeEnum = .postMeta
            }
            if attributeDict.values.first == "wp_posts" {
                typeEnum = .post
            }
            if attributeDict.values.first == "wp_termmeta" {
                typeEnum = .termMeta
            }
            if attributeDict.values.first == "wp_terms" {
                typeEnum = .terms
            }
            if attributeDict.values.first == "wp_term_relationships" {
                typeEnum = .termRelationships
            }
        }
        
        if elementName == "column" {
            self.columns.append(Columns(name: attributeDict.values.first ?? ""))
        }
        
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            switch typeEnum {
            case .some(.post):
                stringsArray.append(data)
            case .none:
                return
            case .some(.postMeta):
                stringsArray.append(data)
            case .some(.termMeta):
                stringsArray.append(data)
            case .some(.terms):
                stringsArray.append(data)
            case .some(.termRelationships):
                stringsArray.append(data)
            case .some(.termTaxonomy):
                stringsArray.append(data)
            
        }
        
    }
}
