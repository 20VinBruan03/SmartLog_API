// token handler

// Base64URL decode function
export function base64UrlDecode(base64Url) {
    let base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    const padding = base64.length % 4;
    if (padding === 2) base64 += '==';
    if (padding === 3) base64 += '=';
    return atob(base64);
}

// Base64URL encode function
export function base64UrlEncode(data) {
    const base64 = btoa(data);
    return base64.replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

// decode JWT (header and payload)
export function decodeJwt(token) {
    const [headerB64, payloadB64, signatureB64] = token.split('.');
    const decodedHeader = JSON.parse(base64UrlDecode(headerB64));
    const decodedPayload = JSON.parse(base64UrlDecode(payloadB64));
    return { header: decodedHeader, payload: decodedPayload, signature: signatureB64 };
}

// Verify HMAC SHA256 signature
export async function verifyJwtSignature(token, secretKey) {
    const { header, payload, signature } = decodeJwt(token);
    const dataToSign = `${base64UrlEncode(JSON.stringify(header))}.${base64UrlEncode(JSON.stringify(payload))}`;
    const signatureBuffer = base64UrlDecode(signature);
    const encoder = new TextEncoder();
    const keyData = encoder.encode(secretKey);
    const dataBuffer = new TextEncoder().encode(dataToSign);

    const key = await crypto.subtle.importKey(
        'raw',
        keyData,
        { name: 'HMAC', hash: { name: 'SHA-256' } },
        false,
        ['sign', 'verify']
    );

    const cryptoSignature = await crypto.subtle.sign('HMAC', key, dataBuffer);
    const cryptoSignatureBase64Url = base64UrlEncode(cryptoSignature);

    return cryptoSignatureBase64Url === signature;
}
