//
/*
 * Copyright © 2017 Teclib. All rights reserved.
 *
 * Request.swift is part of the GLPI API Client Library for Swift,
 * a subproject of GLPI. GLPI is a free IT Asset Management.
 *
 * Glpi is Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ------------------------------------------------------------------------------
 * @author    Hector Rondon - <hrondon@teclib.com>
 * @date      18/10/17
 * @copyright (C) 2017 Teclib' and contributors
 * @license   Apache License, Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
 * @link      https://github.com/flyve-mdm/[name]
 * @link      http://www.glpi-project.org/
 * ------------------------------------------------------------------------------
 */
 

import Foundation

/// Session Token
public var SESSION_TOKEN = String()

public class GlpiRequest {

    /**
     Request a session token to uses other api endpoints.
     - parameter: user token
     - parameter: app token (optional)
     */
    class public func initSessionByUserToken(userToken: String, appToken: String = "", completion: @escaping (_ data: AnyObject?,  _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.initSessionByUserToken(userToken, appToken)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request a session token to uses other api endpoints.
     - parameter: user
     - parameter: password
     - parameter: app token (optional)
     */
    class public func initSessionByCredentials(user: String, password: String, appToken: String = "", completion: @escaping (_ data: AnyObject?,  _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.initSessionByCredentials(user, password, appToken)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request kill current session
     */
    class public func killSession(completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.killSession) { data, response, error in
            completion(data, response , error)
        }
    }
    
    /**
     Request get my profiles
     */
    class public func getMyProfiles(completion: @escaping (_ data: AnyObject?,  _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getMyProfiles) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get active profile
     */
    class public func getActiveProfile(completion: @escaping (_ data: AnyObject?,  _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getActiveProfile) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request change active profile
     */
    class public func changeActiveProfile(profileID: String, completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {

        var dictionary = [String: AnyObject]()
        dictionary["profiles_id"] = profileID as AnyObject
        
        GlpiRequest.httpRequest(Routers.changeActiveProfile(dictionary)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get my entities
     */
    class public func getMyEntities(completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getMyEntities) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get active entities
     */
    class public func getActiveEntities(completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getMyEntities) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request change active entities
     */
    class public func changeActiveEntities(entitiesID: String, isRecursive: Bool = false, completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        var dictionary = [String: AnyObject]()
        dictionary["is_recursive"] = isRecursive as AnyObject
        dictionary["entities_id"] = entitiesID as AnyObject
        
        GlpiRequest.httpRequest(Routers.changeActiveProfile(dictionary)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get full session information
     */
    class public func getFullSession(completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getFullSession) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get Glpi Configuration
     */
    class public func getGlpiConfig(completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getGlpiConfig) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get all items
     */
    class public func getAllItems(itemType: ItemType, queryString: QueryString.GetAllItems?, completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getAllItems(itemType, queryString)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get an item
     */
    class public func getItem(itemType: ItemType, itemID: Int, queryString: QueryString.GetAnItem?, completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getItem(itemType, itemID, queryString)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get an item
     */
    class public func getSubItems(itemType: ItemType, itemID: Int, subItemType: ItemType, queryString: QueryString.GetSubItems?, completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getSubItems(itemType, itemID, subItemType, queryString)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request Add Items
     */
    class public func addItems(itemType: ItemType, payload: [String: AnyObject], completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.addItems(itemType, payload)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request Update Items
     */
    class public func updateItems(itemType: ItemType, itemID: Int?, payload: [String: AnyObject], completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.updateItems(itemType, itemID, payload)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request Delete Items
     */
    class public func deleteItems(itemType: ItemType, itemID: Int?, queryString: QueryString.DeleteItems?, payload: [String: AnyObject], completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.deleteItems(itemType, itemID, queryString, payload)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request Lost password
     */
    class public func recoveryPassword(email: String, completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        var dictionary = [String: AnyObject]()
        dictionary["email"] = email as AnyObject
        
        GlpiRequest.httpRequest(Routers.lostPassword(dictionary)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request reset password
     */
    class public func resetPassword(payload: [String: AnyObject], completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.lostPassword(payload)) { data, response, error in
            completion(data, response, error)
        }
    }
    
    /**
     Request get multiple items
     */
    class public func getMultipleItems(completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        GlpiRequest.httpRequest(Routers.getMultipleItems) { data, response, error in
            completion(data, response, error)
        }
    }
    
    class func httpRequest(_ router: Routers, completion: @escaping (_ data: AnyObject?, _ response: HTTPURLResponse?, _ error: Error?) -> Void) {
        
        let task:URLSessionDataTask = URLSession.shared.dataTask(with: router.request()) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode >= 400 {
                        completion(GlpiRequest.handlerErrorData(data, error, httpResponse.statusCode) as AnyObject, response as? HTTPURLResponse, error)
                    } else {
                        
                        guard error == nil, let responseData = data else {
                            completion(GlpiRequest.handlerErrorData(data, error, httpResponse.statusCode) as AnyObject, response as? HTTPURLResponse, error)
                            return
                        }
                        
                        // parse the result as JSON
                        // then create a Todo from the JSON
                        do {
                            if let dataJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] {
                                
                                switch router {
                                case .initSessionByUserToken, .initSessionByCredentials:
                                    if let session_token = dataJSON["session_token"] {
                                        SESSION_TOKEN = session_token as? String ?? ""
                                    }
                                default:
                                    break
                                }
                                completion(dataJSON as AnyObject, response as? HTTPURLResponse, nil)
                                
                            } else {
                                // couldn't create a todo object from the JSON
                                completion(GlpiRequest.handlerErrorData(data, error, httpResponse.statusCode) as AnyObject, response as? HTTPURLResponse, error)
                            }
                        } catch {
                            // error trying to convert the data to JSON using JSONSerialization.jsonObject
                            completion(GlpiRequest.handlerErrorData(data, error, httpResponse.statusCode) as AnyObject, response as? HTTPURLResponse, error)
                            return
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    /**
     handler Error
     - return: error message
     */
    class func handlerErrorData(_ data: Data?, _ error: Error?, _ errorCode: Int) -> [String: String]  {
        
        var errorObj = [String]()
        var errorDict = [String: String]()
        
        if let result = data {
            do {
                errorObj = try JSONSerialization.jsonObject(with: result) as? [String] ?? [String]()
            } catch {
                errorObj = [String]()
            }
        }
        
        if errorObj.count == 2 {
            errorDict["error"] = errorObj[0]
            errorDict["message"] = errorObj[1]
        } else {
            errorDict["error"] = "\(errorCode)"
            errorDict["message"] = "\(error?.localizedDescription ?? "unknown error")"
        }
        
        return errorDict
    }
}
