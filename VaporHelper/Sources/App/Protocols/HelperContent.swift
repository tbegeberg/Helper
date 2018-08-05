//
//  HelperContent.swift
//  App
//
//  Created by TørK on 27/07/2018.
//


import Vapor
import FluentMySQL

protocol HelperContent: MySQLModel, Content, Migration, Parameter {
    
}
