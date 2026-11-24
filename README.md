# Swipe Assist

Swipe Assist is a macOS helper for true-or-false quiz cards. It reads an iPhone Mirroring window or a test image, extracts the statement, and displays **True**, **False**, or **Unsure**. You select answers yourself.

## Requirements

- An Apple silicon Mac running macOS 26 or later
- Apple Intelligence enabled and its on-device model available
- Swift and the macOS SDK from Xcode Command Line Tools
- iPhone Mirroring configured for live window capture
- Apple's Russian and English translation languages, if prompted when opening a Russian card

## Build and run

Run these commands from the repository root.

```sh
./build.sh
open "Swipe Assist.app"
```

In Swipe Assist, click **Choose Window via macOS** and select **iPhone Mirroring**. Turn on **Capture Preview** to check the incoming image. Use **Demo** for a built-in English card or **Open Test Image** to try your own English or Russian screenshot.

## Testing

```sh
./build.sh --test
```

The test generates quiz cards in memory and checks OCR and statement extraction. It checks model answers when Apple Intelligence is available and both translation languages are installed. It does not require a paired phone or start a live quiz.

## Limitations

OCR, Russian-to-English translation, and answer generation run locally. Answers can be wrong, and live capture and model latency vary. The test suite does not measure performance in a timed round.
