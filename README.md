# Valorant Web Radar

Display valorant agent locations on a 2D map, inspired by Leetify 2D Replay (CSGO). Written in Rust, compiles to wasm using wasm-bindgen to build JavaScript packages in Rust.

# Preview with simulated data
![image](https://github.com/henmmi/valorant-web-radar/assets/69184583/03ace6d3-4dd8-40b9-a3b9-800b4aae5a9c)

# Setup and Installation

- [Rust and Cargo](https://rustup.rs/)
- [Node.js and npm](https://nodejs.org/)

```
$ cargo build
$ rustup target add wasm32-unknown-unknown
$ cargo install wasm-pack
$ npm install
```

# Canvas Build
```
$ cd canvas
$ cargo build
$ npm run serve
```

and then visiting http://localhost:8080 in a browser should run !


# Server Build
```
$ cargo run --bin server
```

# Test-Client Build
```
$ cargo run --bin test-client
```





# Valorant Web Radar 在 2D 地圖上顯示 Valorant 特工的位置，靈感來自 Leetify 2D Replay（CSGO）。使用 Rust 編寫，並透過 wasm-bindgen 編譯為 wasm，從而在 Rust 中建構 JavaScript 包。 # 使用模擬資料進行預覽 ![image](https://github.com/henmmi/valorant-web-radar/assets/69184583/03ace6d3-4dd8-40b9-a3b9-800b4aae5a9c) # 設定和安裝 - [Rust 和 Cargo](https://rustup.rs/) - [Node.js 和 npm](https://nodejs.org/) ``` $ cargo build $ rustup target add wasm32-unknown-unknown $ cargo install wasm-pack $ npm install ``` # Canvas 構建 ``` $ cd canvas $ cargo build $ npm run serve ```
