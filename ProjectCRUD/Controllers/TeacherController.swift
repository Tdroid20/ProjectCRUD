//
//  TeacherController.swift
//  ProjectCRUD
//
//  Created by user226765 on 9/21/22.
//

import Foundation;


class TeacherController: ObservableObject {
    @Published var resutsData: [TeacherModel] = [];
    @Published var TeacherResult: TeacherModel = TeacherModel(id: 0, nome: "Teste", email: "Teste");
    let urlAddr : String = "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores";
    
    init() {
        findAll();
    }
    
    func deleteTeacher(id : Int){
        
        guard let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores/\(id)") else {
            print("URL NOT FOUND")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            
            if error != nil {
                print("error: \(error!)")
                return
            } else {
                self.findAll()
            }
            
            //resume executa a tarefa
        }.resume()
        //dataTask
        
    }
    
    func findAll() {
        guard let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores") else {
            return print("URL Not Found");
        }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                return print("Error: \(error!)")
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode([TeacherModel].self, from: data)
                    self.resutsData = result;
                } catch {
                    return print("Error in Request Data: \(error)")
                }
                
            }
        }.resume()
    }
    
    func findOneById(id: Int) async -> Any {
        guard let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores/\(id)") else {
            return print("URL Not Found");
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                return print("Error: \(error!)")
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(TeacherModel.self, from: data)
                    self.TeacherResult = result;
                     
                } catch {
                    return print("Error in Request Data")
                }
            }
        }.resume()
        return TeacherResult;
    }
    
    func createTeacher(name: String, email: String) {
        guard let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores") else {
            return print("Error in create Request Data")
        }
        
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let teacher: TeacherModel = TeacherModel(id: 0, nome: name, email: email);
        
        do {
            request.httpBody = try JSONEncoder().encode(teacher)
        } catch {
            return print("Error to send create Request")
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                return print("Error: \(error!)")
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(TeacherModel.self, from: data)
                    print("\(result.id)")
                    self.findAll()
                    
                } catch {
                    return print("Error in Request Data \(error)")
                }
            }
        }.resume()
    }
    
    func updateTeacher(id: Int, name: String, email: String) {
        guard let url = URL(string: "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores/\(id)") else {
            return print("URL Not Found");
        }
        
        var request = URLRequest(url: url);
        request.httpMethod = "PATCH";
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        
        let teacher: TeacherModel = TeacherModel(id: id, nome: name, email: email);
        
        do {
            request.httpBody = try JSONEncoder().encode(teacher)
        } catch {
            return print("Error to send update Request")
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                return print("Error: \(error!)")
            }
            
            if let data = data {
                do {
                    try JSONDecoder().decode(TeacherModel.self, from: data)
                    
                } catch {
                    return print("Error in Request Data")
                }
            }
        }.resume()
    }
}
