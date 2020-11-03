//
//  ViewController.swift
//  UICollectionViviewList
//
//  Created by Steven Lipton on 10/30/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 13 (Q1 2021) video 05
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Learn how to make a list uisng UICollectionview.
//  For more code, go to http://bit.ly/AppPieGithub

import UIKit

class ViewController: UIViewController {
    var sections = [0]
    var items = ["pencil","highlighter","paperclip","scissors","paintbrush","ruler","pin"]
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //layout - the flow of the cells.
        let layout = UICollectionViewCompositionalLayout.list(using: UICollectionLayoutListConfiguration(appearance: .insetGrouped))
        
        //add the view using the layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.addSubview(collectionView)
        
        //content - populating the cell
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell,String>{
            (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item
            content.image = UIImage(systemName:item)
            cell.contentConfiguration = content
        }
        
        //Datasource - the data for the collection view.
        let datasource = UICollectionViewDiffableDataSource<Int,String>(collectionView: collectionView) { (collectionView:UICollectionView, indexPath:IndexPath, identifier:String) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        //adding the data to the snapshot.
        var snapshot = NSDiffableDataSourceSnapshot<Int,String>()
        snapshot.appendSections(sections)
        snapshot.appendItems(items)
        datasource.apply(snapshot)
        
    }


}

