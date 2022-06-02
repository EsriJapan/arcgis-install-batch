# arcgis-install-batch
# 概要
本ページは「[ArcGIS Desktop 楽々インストール ～バッチ ファイルの作成方法をご紹介～](https://blog.esrij.com/2018/03/30/post-29732/) 」で取り上げた**バッチファイル** のサンプル集です。
ダウンロード形式で提供されている製品本体（exe）を解凍し、フォルダ階層にパッチファイルを含めて再整理した後、大量のPCに一括でインストールを行うための**バッチファイル** をサンプルとして提供しています。また、アンインストールを行うための**バッチファイル** のサンプルも提供しています。



## 更新履歴
### ArcGIS Desktop / ArcGIS Engine
* ArcGIS Desktop 10.5.1 / ArcGIS Engine 10.5.1 用のものをサンプルとして作成しました。  
* ArcGIS Desktop 10.6   / ArcGIS Engine 10.6 用のものをサンプルとして追加しました（2018/06/07）。  
* ArcGIS Desktop 10.6.1 / ArcGIS Engine 10.6.1 用のものをサンプルとして追加しました（2018/12/06）。  
* ArcGIS Desktop 10.7   / ArcGIS Engine 10.7 用のものをサンプルとして追加しました（2019/07/26）。  
* ArcGIS Desktop 10.7.1 / ArcGIS Engine 10.7.1 用のものをサンプルとして追加しました（2019/10/11）。  
* ArcGIS Desktop 10.8 / ArcGIS Engine 10.8 用のものをサンプルとして追加しました（2020/05/18）。  
* ArcGIS Desktop 10.8.1 / ArcGIS Engine 10.8.1 用のものをサンプルとして追加しました（2020/10/20）。  
* ArcGIS Desktop 10.8.2 / ArcGIS Engine 10.8.2 用のものをサンプルとして追加しました（2022/06/02）。  
  
### ArcGIS Pro
* ArcGIS Pro 2.0 用のものをサンプルとして作成しました。  
* ArcGIS Pro 2.1 用のものをサンプルとして追加しました（2018/06/07）。  
* ArcGIS Pro 2.2 用のものをサンプルとして追加しました（2018/12/06）。  
* ArcGIS Pro 2.3 用のものをサンプルとして追加しました（2019/07/26）。  
* ArcGIS Pro 2.4 用のものをサンプルとして追加しました（2019/10/11）。  
* ArcGIS Pro 2.5 用のものをサンプルとして追加しました（2020/04/15）。  
* ArcGIS Pro 2.6 用のものをサンプルとして追加しました（2020/09/12）。  
* ArcGIS Pro 2.7 用のものをサンプルとして追加しました（2021/02/15）。  
* ArcGIS Pro 2.8 用のものをサンプルとして追加しました（2021/06/30）。本バージョンから、ArcGIS Coordinate Systems Data もバッチファイルに追加しています。  
* ArcGIS Pro 2.9 用のものをサンプルとして追加しました（2022/01/19）。  

インストーラの構成は他のバージョンでもほとんど変わりませんが、パッチファイル（特に任意インストールのパッチファイル）の要/不要はお使いの環境によって異なりますので、適宜判断して編集してください。

また、アンインストール用の**バッチファイル** のGUIDを調べるためには、Windows SDKに含まれている「orca」等のツールが必要です。

- [Insatll_Batchfiles] - インストール用の**バッチファイル** の格納先

- [Uninstall_Batchifiles] - アンインストール用の**バッチファイル** の格納先

- [Ps_Scripts] - MSI, MSP からアンインストール用の**バッチファイルコマンド** を作成するPowerShellのスクリプト


## ライセンス
Copyright 2018 Esri Japan Corporation.

Apache License Version 2.0（「本ライセンス」）に基づいてライセンスされます。あなたがこのファイルを使用するためには、本ライセンスに従わなければなりません。本ライセンスのコピーは下記の場所から入手できます。

> http://www.apache.org/licenses/LICENSE-2.0

適用される法律または書面での同意によって命じられない限り、本ライセンスに基づいて頒布されるソフトウェアは、明示黙示を問わず、いかなる保証も条件もなしに「現状のまま」頒布されます。本ライセンスでの権利と制限を規定した文言については、本ライセンスを参照してください。

ライセンスのコピーは本リポジトリの[ライセンス ファイル](./LICENSE)で利用可能です。

[](EsriJapan Tags: <タグ（半角スペース区切り）>)
[](EsriJapan Language: <開発言語>)
