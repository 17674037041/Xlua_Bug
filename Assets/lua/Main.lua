print("开始执行")

--初始化准备好的类别名
require("InitClass")
--初始化物品信息
require("ItemData")
--玩家信息
require("PlayerData")
PlayerData:Init()

require("MainPanel")
require("BagPanel")
require("ItemGrid")
require("ObjectPool")
MainPanel:ShowMainPanel()
