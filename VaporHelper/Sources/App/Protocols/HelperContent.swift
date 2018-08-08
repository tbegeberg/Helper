//
//  HelperContent.swift
//  App
//
//  Created by TørK on 27/07/2018.
//


import Vapor
import FluentMySQL
import Authentication

protocol HelperContent: MySQLModel, Content, Migration, Parameter {
    
}


