--这里仿用对象池的原理

--成员变量
local Content = GameObject:Find("Canvas/BagPanel/Bag_bg/Grid_bg/Scroll View/Viewport/Content")

ObjectPool = {}  --table模拟一个对象

--模拟对象的属性
ObjectPool.curr_Page_Grid = {}  --当前页面上的格子
ObjectPool.grid_List = {}  --存放生成的格子（格子池）

--获取一个对象
function ObjectPool:Get_GridObj()  --返回一个可用的格子
    if #self.grid_List > 0 then
        return table.remove( self.grid_List)  --从池中取格子
    end

    --无可用格子 从AB包中加载
    local Grid = ABMgr:LoadRes("ui","Grid_item")
    return Grid
end