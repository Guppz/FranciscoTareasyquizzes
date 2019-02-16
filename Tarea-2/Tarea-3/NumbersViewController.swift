
import UIKit

class NumbersViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrarNib()
    }
    
    func registrarNib(){
        let nib = UINib(nibName: "NumberTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NumberTableViewCell")
    }
}

extension NumbersViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 149.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let  cell = tableView.dequeueReusableCell(withIdentifier: "NumberTableViewCell")as?NumberTableViewCell else{
            return UITableViewCell()
        }
        cell.backgroundColor = evenOddNumberChecker(number: indexPath.row);
        cell.NumberLabel.text = "\(indexPath.row)"
        return cell
    }
    
    
    func evenOddNumberChecker(number: Int) -> UIColor{
        if number % 2 == 0 {
            return UIColor.blue;
        } else {
            return UIColor.red;
        }
    }
}




