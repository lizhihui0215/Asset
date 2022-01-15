//
//  LoginView.swift
//  Assets
//
//  Created by lizhihui on 2022/1/13.
//  Copyright © 2022 ZhiHui.Li. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Image("ttt")
        }.background(Image(XCImage.Login.loginBackground.name).fullScreen())
    }
}

struct FullScreen: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(width: .infinity,
                      height: .infinity,
                      alignment: .center)
    }
}

extension View {
    func fullScreen() -> some View {
        modifier(FullScreen())
    }
}

class LoginHostingController: UIHostingController<LoginView> {
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: LoginView())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
