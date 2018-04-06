//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    let segueIdentifier = "PlanetFacts"
    let planetCellIdentifier = "PlanetCell"
    var planets: [Planet] = []
    
    func generatePlanetInfo() {
        let earthName = "Earth"
        let earthMoons = 1
        let earthOrbit = 365.26
        let earthFacts = [
            "Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "Earth was once believed to be the center of the universe."
        ]
        
        let marsName = "Mars"
        let marsMoons = 2
        let marsOrbit = 687.00
        let marsFacts = [
            "Mars and Earth have approximately the same landmass.",
            "Mars is home to the tallest mountain in the solar system.",
            "Pieces of Mars have fallen to Earth."
        ]
        
        let earth = Planet(name: earthName, numberOfMoons: earthMoons, fullOrbit: earthOrbit, facts: earthFacts)
        let mars = Planet(name: marsName, numberOfMoons: marsMoons, fullOrbit: marsOrbit, facts: marsFacts)
        planets = [earth, mars]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        let planetDetails = planets[indexPath.row]

        cell.planetNameLabel.text = planetDetails.name
        cell.numberOfMoonsLabel.text = "\(planetDetails.numberOfMoons)"
        cell.numberOfDaysFullOrbitLabel.text = "\(planetDetails.fullOrbit)"
        cell.numberOfFactsLabel.text = "\(planetDetails.facts.count)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != segueIdentifier { return }
        print(segue.identifier!)
        if let dest = segue.destination as? FactTableViewController, let indexPath = tableView.indexPathForSelectedRow {
            dest.planet = planets[(indexPath as NSIndexPath).row]
        }
    }
}
