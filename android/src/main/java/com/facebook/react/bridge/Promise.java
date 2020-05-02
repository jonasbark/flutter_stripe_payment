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

  public void reject(String errorCode) {
    reject(errorCode, null, null);
  }

  public void reject(String errorCode, String message) {
    reject(errorCode, message, null);
  }

  public void reject(String errorCode, String message, Object details) {
    result.error(errorCode, message, details);

    if (whenComplete != null) {
      handler.post(whenComplete);
    }
  }
}
