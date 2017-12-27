//
//  CommonFunctions.swift
//  PasswordAutoFill
//
//  Created by Quoc Nguyen on 12/27/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

func isValidated(username: String?, password: String?) -> Bool {
    return username?.count ?? 0 >= 5 &&
        password?.count ?? 0 >= 5
}
