--常用别名都在这里  避免频繁的书写形如CS.UnityEngine.GameObject的代码
require("Object")  --面向对象相关
require("SplitTools")  --字符串拆分
Json=require("JsonUtility")  --Json解析

--unity相关
GameObject=CS.UnityEngine.GameObject
Resources=CS.UnityEngine.Resources
Transform=CS.UnityEngine.Transform
RectTransform=CS.UnityEngine.RectTransform
SpriteAtlas=CS.UnityEngine.SpriteAtlas  --图集
Vector3=CS.UnityEngine.Vector3
Vector2=CS.UnityEngine.Vector2
TextAsset=CS.UnityEngine.TextAsset

--UI相关的
UI=CS.UnityEngine.UI
Button=UI.Button
Image=UI.Image
Text=UI.Text
--Toggle=UI.Toggle
ScrollRect=UI.ScrollRect
Canvas=GameObject.Find("Canvas").transform

--自己写的C#脚本相关
--直接得到AB包资源管理器的单例对象
ABMgr=CS.ABMgr.GetInstance()