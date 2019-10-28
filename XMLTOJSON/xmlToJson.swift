//
//  ViewModel.swift
//  xmlParser
//
//  Created by Matej Hetzel on 23/10/2019.
//  Copyright © 2019 Matej Hetzel. All rights reserved.
//

import Foundation
public class XmlToJson {
    var mainClass: MainClass!
    var restorani = [Restorani]()
    var termID: String!
    
    public init() {
    }
    
    func convertData() -> [Restorani]{
        let parsingClass = MyParser()
        mainClass = parsingClass.returnParsedClass()
      
        
        for restoran in mainClass.termTaxonomy {
            if restoran.taxonomy == "restorani" {
                var tel: String?
                var mob: String?
                var ime: String = ""
                var workingHours: String?
                termID = restoran.termID
                var desertArray = [Meals]()
                      var dodaciArray = [Meals]()
                      var hamburgeriArray = [Meals]()
                      var jelaPoNarudzbiArray = [Meals]()
                      var JelaSRostiljaArray = [Meals]()
                      var KebabRaznoArray = [Meals]()
                      var OstaloArray = [Meals]()
                      var PizzeArray = [Meals]()
                      var PriloziArray = [Meals]()
                      var RibljaJelaArray = [Meals]()
                      var RizotoArray = [Meals]()
                      var SalateArray = [Meals]()
                      var SendviciArray = [Meals]()
                      var TjestenineArray = [Meals]()
        
                  for term in mainClass.terms {
                          if term.termID == termID {
                              ime = term.name
                          }
                      }
                
                for termData in mainClass.termdata {
                    if termData.termID == termID {
                        if termData.metaKey == "kontakt-telefon" {
                            tel = termData.metaValue
                        }
                        if termData.metaKey == "kontakt-mobitel" {
                            mob = termData.metaValue
                        }
                        if termData.metaKey == "radno-vrijeme" {
                            workingHours = termData.metaValue
                        }
                    }
                }
                
                for meal in mainClass.termRelationships {
                    var name: String = ""
                    
                    var ingredientsArray = [Ingredients]()
                    if meal.termTaxonomyID == termID {
                        
                        
                        for mealObject in mainClass.posts {
                            if mealObject.ID == meal.objectID {
                                name = mealObject.postTitle
                            }
                        }
                        
                      
                        
                        let prices = priceFunction(meal)
                        ingredientsArray = ingredientsFunction(meal)
                        
                        
                        for relationship in mainClass.termRelationships {
                                                  if relationship.objectID == meal.objectID {
                                                      for category in mainClass.termTaxonomy {
                                                          if category.termTaxnomyID == relationship.termTaxonomyID && category.taxonomy == "tip_jela"{
                                                                  for categoryOfMeal in mainClass.terms {
                                                                      if category.parent == categoryOfMeal.termID {
                                                                          if categoryOfMeal.slug == "desert" {
                                                                              desertArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "dodaci" {
                                                                              dodaciArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "hamburgeri" {
                                                                              hamburgeriArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "jela-po-narudzbi" {
                                                                              jelaPoNarudzbiArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "kebab-razno" {
                                                                              KebabRaznoArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "ostalo" {
                                                                              OstaloArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "pizze" {
                                                                              PizzeArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                              
                                                                          else if categoryOfMeal.slug == "prilozi" {
                                                                            PriloziArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          else if categoryOfMeal.slug == "riblja-jela" {
                                                                              RibljaJelaArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                              
                                                                          else if categoryOfMeal.slug == "rizoto" {
                                                                              RizotoArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "salate" {
                                                                              SalateArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "sendvici" {
                                                                              SendviciArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          
                                                                          else if categoryOfMeal.slug == "tjestenine" {
                                                                              TjestenineArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                          }
                                                                          else if categoryOfMeal.slug == "jela-s-rostilja" {
                                                                            JelaSRostiljaArray.append(Meals(name: name, priceNormal: prices.1, priceJumbo: prices.2, price: prices.0, ingredients: ingredientsArray))
                                                                        }
                                                                  }
                                                              }
                                                          }
                                                      }
                                                  }
                                              }
                        
                    }
                    
                }
                
                
                
                restorani.append(Restorani(name: ime, tel: tel, mob: mob, workingHours: workingHours, meals: MealTypes(desert: desertArray, dodaci: dodaciArray, hamburgeri: hamburgeriArray, jelaPoNarudzbi: jelaPoNarudzbiArray, jelaSRostilja: JelaSRostiljaArray, kebabRazno: KebabRaznoArray, Ostalo: OstaloArray, pizze: PizzeArray, prilozi: PriloziArray, ribljaJela: RibljaJelaArray, rizoto: RizotoArray, salate: SalateArray, sendvici: SendviciArray, tjestenine: TjestenineArray)))
            }
        }
        
        return restorani
    }
    
    func ingredientsFunction(_ meal: TermRelationships) -> [Ingredients] {
        var localIngredients = [Ingredients]()
        
        for relationship in mainClass.termRelationships {
            if relationship.objectID == meal.objectID {
                for ingredient in mainClass.termTaxonomy {
                    if ingredient.termID == relationship.termTaxonomyID && ingredient.taxonomy == "sastojci" {
                        for ingredientName in mainClass.terms {
                            if ingredientName.termID == ingredient.termID {
                                localIngredients.append(Ingredients(name: ingredientName.slug))
                            }
                        }
                    }
                }
            }
        }
        return localIngredients
    }
    
    func priceFunction(_ meal: TermRelationships) -> (String?, String?, String?) {
        var priceS: String?
        var priceNormal: String?
        var priceJumbo: String?
        
        for price in mainClass.postmeta {
            if price.postID == meal.objectID {
                if price.metaKey == "cijena" {
                    priceS = price.metaValue
                }
                if price.metaKey == "cijena_jumbo" {
                    priceJumbo = price.metaValue
                }
                if price.metaKey == "cijena_normalna" {
                    priceNormal = price.metaValue
                }
            }
        }
        return (priceS, priceNormal, priceJumbo)
    }
    
    public func createAJsonFile(){
        let rest = convertData()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(rest)
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        print(documentDirectoryUrl)
        let fileUrl = documentDirectoryUrl.appendingPathComponent("test.json")
        
        do {
            try data.write(to: fileUrl, options: [])
        } catch {
            print(error)
        }
    }
    
    
}
