package com.facebook.react.bridge;

import android.os.Handler;
import io.flutter.plugin.common.MethodChannel;

/** Created by FFuF, Jonas Bark on 2019-10-02. */
public class Promise {

  private final MethodChannel.Result result;

  private final Handler handler = new Handler();

  private Runnable whenComplete;

  public Promise(MethodChannel.Result result) {
    this.result = result;
  }

  public void setWhenComplete(Runnable whenComplete) {
    this.whenComplete = whenComplete;
  }

  public void resolve(Object result) {
    this.result.success(result);

    if (whenComplete != null) {
      handler.post(whenComplete);
    }
  }

  public void reject(String errorCode, String message) {
    this.result.error(errorCode, message, null);

    if (whenComplete != null) {
      handler.post(whenComplete);
    }
  }

  public void reject(String errorCode) {
    this.reject(errorCode, null);
  }
}
