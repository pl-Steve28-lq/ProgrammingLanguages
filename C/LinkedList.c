#include <stdio.h>
#include <stdlib.h>

typedef struct list {
    int value;
    struct list *next;
} list;

void putInt(int value) { printf("%d\n", value); }

list* new(int value) {
    list* a = (list*) malloc(sizeof(list));
    a->value = value;
    a->next = NULL;
    return a;
}

void add(list* a, int value) {
    if (a->next != NULL) add(a->next, value);
    else {
        list* nxt = new(value);
        a->next = nxt;
    }
}

void map(list* a, void (*f)(int)) {
    list* k = a;
    while (k != NULL) {
        f(k->value);
        k = k->next;
    }
}

int main() {
    list* a = new(1);
    for (int i=1; i<10; i++) add(a, 3*i+1);
    map(a, putInt);
    return 0;
}
