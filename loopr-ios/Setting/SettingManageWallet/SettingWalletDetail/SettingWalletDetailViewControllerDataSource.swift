//
//  SettingWalletDetailViewControllerDataSource.swift
//  loopr-ios
//
//  Created by xiaoruby on 5/14/18.
//  Copyright © 2018 Loopring. All rights reserved.
//

import Foundation
import UIKit

extension SettingWalletDetailViewController {

    func getNumberOfRowsInSection() -> Int {
        if appWallet.setupWalletMethod == .create || appWallet.setupWalletMethod == .importUsingMnemonic {
            return 5
        } else {
            return 4
        }
    }

    func getTableViewCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingWalletDetailTableViewCell(style: .value1, reuseIdentifier: SettingWalletDetailTableViewCell.getCellIdentifier())

        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = FontConfigManager.shared.getLabelFont()
        
        if appWallet.setupWalletMethod == .create || appWallet.setupWalletMethod == .importUsingMnemonic {
            if indexPath.row == 0 {
                cell.contentType = .walletName
                cell.textLabel?.text = NSLocalizedString("Wallet Name", comment: "")
                cell.detailTextLabel?.text = appWallet.name
            } else if indexPath.row == 1 {
                cell.contentType = .backupMnemonic
                cell.textLabel?.text = NSLocalizedString("Backup Mnemonic", comment: "")
            } else if indexPath.row == 2 {
                cell.contentType = .exportPrivateKey
                cell.textLabel?.text = NSLocalizedString("Export Private Key", comment: "")
            } else if indexPath.row == 3 {
                cell.contentType = .exportKeystore
                cell.textLabel?.text = NSLocalizedString("Export Keystore", comment: "")
            } else if indexPath.row == 4 {
                cell.contentType = .clearRecords
                cell.textLabel?.text = NSLocalizedString("Clear Records of this Wallet", comment: "")
                cell.textLabel?.textColor = UIStyleConfig.red
            }
        } else {
            if indexPath.row == 0 {
                cell.contentType = .walletName
                cell.textLabel?.text = NSLocalizedString("Wallet Name", comment: "")
                cell.detailTextLabel?.text = appWallet.name
            } else if indexPath.row == 1 {
                cell.contentType = .exportPrivateKey
                cell.textLabel?.text = NSLocalizedString("Export Private Key", comment: "")
            } else if indexPath.row == 2 {
                cell.contentType = .exportKeystore
                cell.textLabel?.text = NSLocalizedString("Export Keystore", comment: "")
            } else if indexPath.row == 3 {
                cell.contentType = .clearRecords
                cell.textLabel?.text = NSLocalizedString("Clear Records of this Wallet", comment: "")
                cell.textLabel?.textColor = UIStyleConfig.red
            }
        }
        
        return cell
    }

}
