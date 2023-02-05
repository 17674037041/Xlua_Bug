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
        string path = Application.streamingAssetsPath + "/ui";
        AssetBundle ab = AssetBundle.LoadFromFile(path);
        string[] n = ab.GetAllAssetNames();
        foreach (string item in n)
        {
            Debug.Log(item);
        }
        
    }
}
