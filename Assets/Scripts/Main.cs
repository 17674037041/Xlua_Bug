using System.Threading;
using System;
using System.Globalization;
using System.Runtime.CompilerServices;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Main : MonoBehaviour
{
    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");
        test();
    }

    void test()
    {
        Debug.Log("≤‚ ‘git202222");
        AssetBundle ab = null;
        ABMgr.GetInstance().GetabDic.TryGetValue("ui", out ab);
        string[] s = ab.GetAllAssetNames();
        foreach(string item in s)
        {
            Debug.Log(item);
        }
    }
}
