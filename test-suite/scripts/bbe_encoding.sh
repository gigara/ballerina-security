curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/vswan-lake-alpha2/examples/url-encode-decode/url_encode_decode.bal > packages/bbe.encoding/encoding.bal
curl https://raw.githubusercontent.com/ballerina-platform/ballerina-distribution/vswan-lake-alpha2/examples/url-encode-decode/tests/url_encode_decode_test.bal > packages/bbe.encoding/tests/encoding_test.bal

bal build packages/bbe.encoding
