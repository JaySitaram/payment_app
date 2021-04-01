package com.example.rekur_fluter

import android.R
import android.graphics.Color
import android.view.LayoutInflater
import android.widget.TextView
import com.google.android.gms.ads.formats.UnifiedNativeAd
import com.google.android.gms.ads.formats.UnifiedNativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin.NativeAdFactory


internal class NativeAdFactoryExample(private val layoutInflater: LayoutInflater) : NativeAdFactory {
    override fun createNativeAd(
            nativeAd: UnifiedNativeAd, customOptions: Map<String?, Any?>?): UnifiedNativeAdView {
        val adView: UnifiedNativeAdView = layoutInflater.inflate(R.layout.my_native_ad, null) as UnifiedNativeAdView
        val headlineView: TextView = adView.findViewById(R.id.ad_headline)
        val bodyView: TextView = adView.findViewById(R.id.ad_body)
        headlineView.setText(nativeAd.getHeadline())
        bodyView.setText(nativeAd.getBody())
        adView.setBackgroundColor(Color.YELLOW)
        adView.setNativeAd(nativeAd)
        adView.setBodyView(bodyView)
        adView.setHeadlineView(headlineView)
        return adView
    }

}