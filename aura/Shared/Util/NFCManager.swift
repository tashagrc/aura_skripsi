//
//  NFCManager.swift
//  aura
//
//  Created by Natasha Radika on 30/01/25.
//

import CoreNFC

class NFCManager: NSObject, NFCNDEFReaderSessionDelegate {
    static let shared = NFCManager()
    
    private var nfcSession: NFCNDEFReaderSession?
    var onTagDetected: ((String) -> Void)?

    private override init() {}

    func startScanning(onTagDetected: @escaping (String) -> Void) {
        guard NFCNDEFReaderSession.readingAvailable else {
            print("NFC is not available on this device.")
            return
        }
        
        self.onTagDetected = onTagDetected
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.alertMessage = "Hold your phone near the Aura tag to scan."
        nfcSession?.begin()
    }
    
    // MARK: - NFC Delegate Methods
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        guard let firstRecord = messages.first?.records.first,
              let rfidText = String(data: firstRecord.payload, encoding: .utf8) else {
            session.invalidate(errorMessage: "Invalid tag detected.")
            return
        }
        
        print("Scanned RFID: \(rfidText)")
        DispatchQueue.main.async {
            self.onTagDetected?(rfidText)
        }
        session.invalidate()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFC Session Invalidated: \(error.localizedDescription)")
    }
}


