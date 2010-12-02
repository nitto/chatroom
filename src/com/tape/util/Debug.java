package com.tape.util;

/**
 * <p>Title: Debug </p>
 * <p>Description: 这个类封装了所有的打印调试信息的方法。
 * 如果设置了显示调试信息则能打印出信息，否则不能打印调试信息</p>
 * <p>Copyright:(c) 2008 </p>
 * <p>Company: </p>
 * @author Zhantao Feng
 * @version 1.0
 */

public final class Debug {

  public static final boolean debuggingOn = true; //打印调试信息的开关

  /**
   * 判断条件是否为真，如果为false则throw IllegalArgumentException
   * @param condition boolean 条件
   *
   */
  public static void isAssert(boolean condition) {
    if (!condition) {
      println("Assert Failed: ");
      throw new IllegalArgumentException();
    }
  }

  /**
   * 打印调试信息
   * @param msg 调试信息
   */
  public static void print(String msg) {
    if (debuggingOn) {
      System.out.print(msg);
    }
  }

  /**
   * 打印一行调试信息
   * @param msg 调试信息
   */
  public static void println(String msg) {
    if (debuggingOn) {
      System.out.println(msg);
    }
  }

  /**
   * 打印出Exception的信息和出错堆栈还有调试信息msg
   * @param e 异常
   * @param msg 调试信息
   */
  public static void print(Exception e, String msg) {
    print( (Throwable) e, msg);
  }

  /**
   * 打印出Exception的信息和出错堆栈
   * @param e 异常
   */
  public static void print(Exception e) {
    print(e, null);
  }

  /**
   *打印出Throwable的信息和堆栈信息还有调试信息msg
   *@param t  抛出的异常
   *@param msg 调试信息
   */
  public static void print(Throwable t, String msg) {
    if (debuggingOn) {
      System.out.println("Received throwable with Message: " + t.getMessage());
      if (msg != null)
        System.out.print(msg);
      t.printStackTrace();
    }
  }

  /**
   * 打印出Throwable的信息和堆栈信息
   * @param t  抛出异常
   */
  public static void print(Throwable t) {
    print(t, null);
  }

  /**
   * 打印整型数据
   * @param i  要打印的信息
   */
  public static void println(int i) {
    if (debuggingOn) {
      System.out.println(i);
    }
  }

  /**
   * 打印Integer类型数据
   * @param Int  要打印的信息
   */
  public static void println(Integer Int) {
    if (debuggingOn) {
      System.out.println(Int.intValue());
    }
  }

  /**
   * 打印长整型数据
   * @param msgL  要打印的信息
   */
  public static void println(long msgL) {
    if (debuggingOn) {
      System.out.println(msgL);
    }
  }

  /**
   * 打印长整型数据
   * @param msgL  要打印的信息
   */
  public static void println(Long msgL) {
    if (debuggingOn) {
      System.out.println(msgL.longValue());
    }
  }

  /**
   * 打印float型数据
   * @param fltMsg  要打印的信息
   */
  public static void println(float fltMsg) {
    if (debuggingOn) {
      System.out.println(fltMsg);
    }
  }

  /**
   *打印Float型数据
   * @param fltMsg  要打印的信息
   */
  public static void println(Float fltMsg) {
    if (debuggingOn) {
      System.out.println(fltMsg.floatValue());
    }
  }

  /**
   * 打印double型数据
   * @param dblMsg  要打印的信息
   */
  public static void println(double dblMsg) {
    if (debuggingOn) {
      System.out.println(dblMsg);
    }
  }

  /**
   * 打印Double型数据
   * @param dblMsg  要打印的信息
   */
  public static void println(Double dblMsg) {
    if (debuggingOn) {
      System.out.println(dblMsg.doubleValue());
    }
  }

  /**
   * 打印对象
   * @param obj  要打印的对象
   */
  public static void println(Object obj) {
    if (debuggingOn) {
      System.out.println(obj);
    }
  }

  /**
   * 打印某个字符
   * @param c  要打印的字符
   */
  public static void println(char c) {
    if (debuggingOn) {
      System.out.println(c);
    }
  }

  /**
   * 打印字符数组
   * @param chars  要打印的字符数组
   */
  public static void println(char[] chars) {
    if (debuggingOn) {
      System.out.println(chars);
    }
  }

  /**
   * 打印Byte类型的数据
   * @param bt  要打印的信息
   */
  public static void println(java.lang.Byte bt) {
    println(bt.toString());
  }

  /**
   * 打印Byte类型的数据
   * @param bt  要打印的信息
   */
  public static void println(byte bt) {
    println(Byte.toString(bt));
  }

  /**
   * 打印boolean型信息
   * @param b  要打印的信息
   */
  public static void println(boolean b) {
    if (debuggingOn) {
      System.out.println(b);
    }
  }

  /**
   * 打印Boolean型信息
   * @param Bobj  要打印的信息
   */
  public static void println(Boolean Bobj) {
    if (debuggingOn) {
      System.out.println(Bobj.booleanValue());
    }
	}
}

