import kotlin.reflect.KProperty
import kotlin.properties.ReadWriteProperty

fun main() {
    var ex by LLazy {
        "Hello, World!"
    }
    
    println(ex)
    ex = "Hello, Kotlin!"
    println(ex)
}

class LLazy <T> (private val block: () -> T): ReadWriteProperty<T, T> {
    private var value: T? = null
    var isInitialized = false
    
    override fun getValue(thisRef: T, property: KProperty<*>): T {
        if (isInitialized) return value!!
        value = block()
        isInitialized = true
        return value!!
    }
    
    override fun setValue(thisRef: T, property: KProperty<*>, newValue: T) {
        value = newValue
        isInitialized = true
    }
}
