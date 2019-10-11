package sg.edu.ntu.sce.sands.crypto.dcpabe.key;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import java.io.Serializable;
import java.util.Arrays;


public class SecretKey implements Serializable {
    private static final long serialVersionUID = 1L;
    private byte[] ai;
    private byte[] yi;

    @JsonCreator
    public SecretKey(
            @JsonProperty("ai") byte[] ai,
            @JsonProperty("yi") byte[] yi) {
        this.ai = ai;
        this.yi = yi;
    }

    public byte[] getAi() {
        return ai;
    }

    public byte[] getYi() {
        return yi;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SecretKey secretKey = (SecretKey) o;
        return Arrays.equals(getAi(), secretKey.getAi()) &&
                Arrays.equals(getYi(), secretKey.getYi());
    }

    @Override
    public int hashCode() {
        int result = Arrays.hashCode(getAi());
        result = 31 * result + Arrays.hashCode(getYi());
        return result;
    }

    @Override
    public String toString() {
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
        try {
            return ow.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "error";
    }
}
