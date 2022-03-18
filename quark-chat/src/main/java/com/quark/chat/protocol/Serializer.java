package com.quark.chat.protocol;

import com.google.gson.*;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;

//用于拓展序列化，反序列化算法
public interface Serializer {
//    反序列化方法
    <T> T deserialize(Class<T> clazz,byte[] bytes);
//    序列化方法
    <T> byte[] serialize(T object);
    @Slf4j
    enum  Algorithm implements Serializer{
        Java{
            @Override
            public <T> T deserialize(Class<T> clazz, byte[] bytes) {
                T message = null;
                try {
                    ObjectInputStream ois = new ObjectInputStream(new ByteArrayInputStream(bytes));
                    message = (T) ois.readObject();
                } catch (IOException e) {
                    log.debug("反序列化失败");
                } catch (ClassNotFoundException e) {
                    log.debug("反序列化失败");
                }
                return message;
            }

            @Override
            public <T> byte[] serialize(T object) {
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                ObjectOutputStream oos = null;
                try {
                    oos = new ObjectOutputStream(bos);
                    oos.writeObject(object);
                } catch (IOException e) {
                    log.debug("序列化失败");
                    e.printStackTrace();
                }
                byte[] bytes = bos.toByteArray();
                return bytes;
            }
        },
        Json{
            @Override
            public <T> T deserialize(Class<T> clazz, byte[] bytes) {
                String json = new String(bytes,StandardCharsets.UTF_8);
                Gson gson = new GsonBuilder().registerTypeAdapter(Class.class, new ClassCodec()).create();
                return gson.fromJson(json,clazz);
            }

            @Override
            public <T> byte[] serialize(T object) {
                Gson gson = new GsonBuilder().registerTypeAdapter(Class.class, new ClassCodec()).create();
                String json = gson.toJson(object);
                byte[] bytes = json.getBytes(StandardCharsets.UTF_8);
                return bytes;
            }
        }
    }
    class ClassCodec implements JsonSerializer<Class<?>>, JsonDeserializer<Class<?>> {

        @Override
        public Class<?> deserialize(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {

            try {
                String str = jsonElement.getAsString();
                return Class.forName(str);
            } catch (ClassNotFoundException e) {
                throw new JsonParseException(e);
            }
        }

        @Override
        public JsonElement serialize(Class<?> aClass, Type type, JsonSerializationContext jsonSerializationContext) {

            return new JsonPrimitive(aClass.getName());
        }
    }
}
